namespace :start do
  task :development do
    sh %(heroku local -f Procfile.dev)
  end
end

desc 'Starts application API and client'
task start: 'start:development'
