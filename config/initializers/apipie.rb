Apipie.configure do |config|
  config.app_name                = "TinyUrlApp"
  config.api_base_url            = "/api"
  config.doc_base_url            = "/tiny_urls_apidoc"
  config.validate                = false
  # where is your API defined?
  config.api_controllers_matcher = "#{Rails.root}/app/controllers/**/*.rb"
end


