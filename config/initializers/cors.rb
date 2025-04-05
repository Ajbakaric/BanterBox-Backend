Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://playful-croissant-d2c181.netlify.app'

    resource '*',
      headers: :any,
      methods: [:get, :post, :put, :patch, :delete, :options, :head],
      expose: ['Authorization'],
      credentials: true  # ← ✅ THIS LINE allows cookies + Authorization headers

    resource '/cable',
      headers: :any,
      methods: [:get, :post, :options],
      expose: ['Authorization'],
      credentials: true  # ← ✅ SAME HERE
  end
end
