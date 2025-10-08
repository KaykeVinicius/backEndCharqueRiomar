Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins '*'   # ou seu front específico

    resource '*',
      headers: :any,
      expose: ['Authorization'],  # permite o front acessar o header Authorization
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
end
