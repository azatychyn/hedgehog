# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of the Config module.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config

# Sample configuration:
#
#     config :logger, :console,
#       level: :info,
#       format: "$date $time [$level] $metadata$message\n",
#       metadata: [:user_id]
#

config :binance,
  api_key: "bsZx0eOvoQoTGSADhovUrFEXo9RMwBqrx4jTM5NcC63YHrXlQqKDiqtSwvLa2Lnq",
  secret_key: "HCWkvRm6RZaySSUhOVANxCWNpYkjMil5uUx1sF0qmVogAm0jOOWzyqxXW7QnxlUu",
  end_point: "https://testnet.binance.vision"

config :logger,
  level: :info
