VCR.configure do |config|
  config.cassette_library_dir = "#{::Rails.root}/spec/cassettes"
  config.hook_into :faraday
  config.ignore_localhost = true
  config.configure_rspec_metadata!
end
