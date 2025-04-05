Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*' # <- open to any origin for now

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'],
      credentials: true
  end
end


Rails.logger.info "🔥 CORS middleware loaded"
