namespace :spec do
  desc 'Run all client specs'
  task :client do
    sh %(yarn --cwd client test)
  end

  desc 'Run unit tests (Models, Presenters)'
  task unit: %w[models presenters]

  desc 'Run integration tests (APIs, Interactors, Repositories)'
  task integration: %w[api interactors interfaces repositories]

  desc 'Run acceptance tests (Features)'
  task acceptance: %w[features]
end
