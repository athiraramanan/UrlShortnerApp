Rails.application.routes.draw do
  apipie
  root 'api/tiny_urls#get_url'
    namespace :api do
      resource :tiny_url do
        get 'get_url'
      end
    end
end
