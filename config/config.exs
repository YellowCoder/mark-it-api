# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mark_it,
  ecto_repos: [MarkIt.Repo]

# Configures the endpoint
config :mark_it, MarkItWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "CDY3NJ5ZYDCxpBXnUGuDEhu/6jJr73R1HeKNoaakCAwss2A5MyK7P3xTd/MDh78W",
  render_errors: [view: MarkItWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: MarkIt.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
