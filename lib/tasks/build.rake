namespace :build do
  desc 'Builds client'
  task :client do
    sh %(yarn heroku-postbuild)
  end
end
