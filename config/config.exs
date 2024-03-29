# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# Configures the endpoint
config :vaporbot, VaporbotWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "PAXG+ZIbHoBVh2u3yvZaeKyjymxWgSOdzeiMqWwSD+7GKGj9vGRSNHK6RbeI7bNj",
  render_errors: [view: VaporbotWeb.ErrorView, accepts: ~w(html json)],
  pubsub_server: [name: Vaporbot.PubSub]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
