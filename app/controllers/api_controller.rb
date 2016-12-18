class ApiController < ActionController::Base
  respond_to :json
  rescue_from Apipie::ParamMissing do |exception|
    render status: 400, json: {
      param: exception.param,
      error: exception.to_s
    }
  end
  rescue_from Apipie::ParamInvalid do |exception|
    render status: 400, json: {
      param: exception.param,
      error: exception.to_s
    }
  end

end
