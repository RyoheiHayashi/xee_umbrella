use Mix.Config

# Configure your database
config :xee, Xee.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "xee_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
