require 'rake'
load './lib/tasks/build.rake'

RSpec.configure do |config|
  config.before(:all, type: :system) do
    puts 'Building client (rake build:client)'
    Rake::Task['build:client'].invoke
  end

  config.before(:each, type: :system) do
    driven_by :rack_test
  end

  config.before(:each, type: :system, js: true) do
    driven_by :selenium_chrome_headless
  end
end
