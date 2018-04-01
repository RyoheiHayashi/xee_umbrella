use Mix.Config

config :xee, ecto_repos: [Xee.Repo]

import_config "#{Mix.env}.exs"
