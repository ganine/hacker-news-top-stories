namespace :start do
  task :development do
    desc 'Starts application api and client'
    sh %(heroku local -f Procfile.dev)
  end
end

task start: 'start:development'
