##
# Class for handling api for TinyUrls
class Api::TinyUrlsController < ApiController
   before_filter :validate_input_url, only: [:create]

  resource_description do
    short "API for shortening large urls"
  end
  
  api :POST, '/tiny_url', "Create TinyUrls"
  description <<-EOS
  == Create TinyUrls
   This API is used to create the tiny urls from large urls.
  EOS
  error code: 200, desc: "Success Response"
  error code: 400, desc: "Bad Request"
  param :tiny_url, Hash, :description => "Large Url inputs", required: true do
    param :full_url, String, :desc => "Url need to shorten", :required => true
  end
 
  def create
  	@tiny_url = TinyUrl.new(tiny_url_params)
    domain=request.original_url
    shortend_url=TinyUrl.generate_tiny_url(@tiny_url.full_url)
    @tiny_url.shortend_url=shortend_url
    new_url=domain.split("api")[0]+"?"+shortend_url
    existing_url=TinyUrl.get_full_url shortend_url
    if existing_url
      render :status => :ok, :json => {:shortend_url=>new_url,message: t('api.tiny_urls.successfully_created')}
    else
      if (@tiny_url.save)
    	  render :status => :ok, :json => {:shortend_url=>new_url,message: t('api.tiny_urls.successfully_created')}
      else
        render status: :bad_request, json: { message: @tiny_url.errors.full_messages}
      end 
    end	
  end
  
  api :GET, '/tiny_url/', "Get Tiny Urls"
  description <<-EOS
  == Display tiny_url
   This API is used for redirecting tiny urls to orginal urls .
  EOS
  error code: 200, desc: "Success Response (Redirect to the orginal site)"
  error code: 400, desc: "Bad Request"
  error code: 404, desc: "Not Found"

  def get_url
    domain=request.original_url
    @tiny_url=TinyUrl.get_full_url(domain.split('?')[1]) if domain
    if @tiny_url
      full_url=@tiny_url.full_url
      redirect_to full_url
    else 
      render :status => :not_found, :json => {message: t('api.tiny_urls.no_data_found')}
    end   
  end
  
  private

  def validate_input_url
    unless tiny_url_params[:full_url] =~ URI.regexp
      render :status => :bad_request, :json => {message: t('api.tiny_urls.invalid_url')}and return
    end
  end

  def tiny_url_params
    params.require(:tiny_url).permit(:full_url)
  end

end
