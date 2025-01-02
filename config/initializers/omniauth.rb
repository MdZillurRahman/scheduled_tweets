Rails.application.config.middleware.use Omniauth::Builder do
  provider :twitter, Rails.application.credentials.dig(:twitter, :api_key)
end