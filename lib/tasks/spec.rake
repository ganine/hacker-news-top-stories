namespace :spec do
  desc 'Run all client specs'
  task :client do
    sh %(yarn --cwd client test)
  end
end
