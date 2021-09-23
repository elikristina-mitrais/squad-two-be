# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :kargohackathon,
  ecto_repos: [Kargohackathon.Repo]

# Configures the endpoint
config :kargohackathon, KargohackathonWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "I+/BqKY8OEVT4uqLcF6P+N2RkZazBazlOXFpOoKGK8vRisndGyMbgxq/roe+M6aq",
  render_errors: [view: KargohackathonWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Kargohackathon.PubSub,
  live_view: [signing_salt: "6g1Qb1mx"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
