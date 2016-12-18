require "rails_helper"

RSpec.describe "routes for TinyUrls", :type => :routing do 

  it "routes post create" do
      expect(:post => "api/tiny_url").to route_to(
        :controller => "api/tiny_urls",
        :action => "create"
      )
    end

    # it "routes get create" do
    #   expect(:get => "api/tiny_urls/get_url").to route_to(
    #     :controller => "api/tiny_urls",
    #     :action => "get_url"
    #   )
    # end
  
 
end
