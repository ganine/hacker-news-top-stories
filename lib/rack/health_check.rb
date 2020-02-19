module Rack
  class HealthCheck
    def call(_env)
      status = {
        postgres: {
          connected: postgres_connected,
          migrations_updated: postgres_migrations_updated
        }
      }

      [200, {}, [status.to_json]]
    end

    protected

    def postgres_connected
      ApplicationRecord.establish_connection
      ApplicationRecord.connection
      ApplicationRecord.connected?
    rescue StandardError
      false
    end

    def postgres_migrations_updated
      return false unless postgres_connected

      !ApplicationRecord.connection.migration_context.needs_migration?
    end
  end
end
