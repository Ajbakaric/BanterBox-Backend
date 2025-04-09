require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChatAppApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.1

    # Add autoload paths
    config.autoload_lib(ignore: %w(assets tasks))

    # Enable cookies and session middleware
    config.middleware.use ActionDispatch::Cookies
    config.middleware.use ActionDispatch::Session::CookieStore

    # Disable strict origin check (optional)
    config.action_controller.forgery_protection_origin_check = false

    # Enable API-only mode
   # config.api_only = true
  end
end
