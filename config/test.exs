use Mix.Config

# Configure your database
config :proyecto3, Proyecto3.Repo,
  username: "root",
  password: "",
  database: "proyecto3_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :proyecto3, Proyecto3Web.Endpoint,
  http: [port: 4002],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn
