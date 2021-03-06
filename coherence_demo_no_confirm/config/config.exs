# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :coherence_demo,
  ecto_repos: [CoherenceDemo.Repo]

# Configures the endpoint
config :coherence_demo, CoherenceDemoWeb.Endpoint,
  url: [host: System.get_env("DOMAIN"), port: System.get_env("PORT")],
  secret_key_base: "yaNNya8vWNDM+ihswWBISb2P8q5wGtmWZMjS2q/f5dtewaJv7p7AIqq8kviOTGZM",
  render_errors: [view: CoherenceDemoWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: CoherenceDemo.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: CoherenceDemo.Coherence.User,
  repo: CoherenceDemo.Repo,
  module: CoherenceDemo,
  web_module: CoherenceDemoWeb,
  router: CoherenceDemoWeb.Router,
  messages_backend: CoherenceDemoWeb.Coherence.Messages,
  logged_out_url: "/",
  email_from_name: System.get_env("DOMAIN"),
  email_from_email: System.get_env("SMTP_USERNAME"),
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :invitable, :registerable]

config :coherence, CoherenceDemoWeb.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: System.get_env("MAILGUN_KEY"),
  domain: System.get_env("DOMAIN")
# %% End Coherence Configuration %%
