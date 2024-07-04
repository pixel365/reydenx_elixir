import Config

config :reydenx, :http_client, HTTPoison
config :reydenx, :username, System.get_env("REYDENX_EMAIL")
config :reydenx, :password, System.get_env("REYDENX_PASSWORD")
