require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module EnergySavingStore
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.secret_key_base = 'b089707cc23edb8e09a74d87f9aa2a2efc0e5e649e8cd461b1290c3a2d610c06f0dcda2bff66f8fc6b84488cde654648247bf02b34afdb8744169bb16bbe29d3'
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
  end
end
