ExUnit.start()

Mox.defmock(HTTPoison.BaseMock, for: HTTPoison.Base)

Application.put_env(:reydenx, :http_client, HTTPoison.BaseMock)
Application.put_env(:reydenx, :username, "username")
Application.put_env(:reydenx, :password, "password")
