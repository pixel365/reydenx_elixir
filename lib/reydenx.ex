defmodule Reydenx do
  @moduledoc """
  Reyden-X is an automated service for promoting live broadcasts on
  external sites with integrated system of viewers and views management

  [API Documentation](https://api.reyden-x.com/docs)

  [Website](https://reyden-x.com/en)
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.Model.Token
  alias Reydenx.Response
  import Reydenx.{Guards, Utils}
  import Application

  @base_url "https://api.reyden-x.com/v1"

  @doc """
  Sends a request to obtain an API access token.
  Login and password must be set in the environment variables 'REYDENX_EMAIL' and 'REYDENX_PASSWORD'

  See: [API Documentation](https://api.reyden-x.com/docs#/Token/Get_authorization_token_v1_token__post)

  ## Examples:

    ### Success:

      iex> Reydenx.new()
      {:ok, %Reydenx.Model.Token{
        access_token: "XXX",
        token_type: "bearer",
        expires_in: "2024-01-01T10:00:00.049560+00:00"
      }}

    ### Fail

      iex> Reydenx.new()
      {:error, %Reydenx.Model.ResponseError{
        path: "/token/",
        status_code: 429,
        message: "Retry After: 7"
      }}
  """
  @doc since: "0.1.0"
  @spec new() :: {:error, ResponseError} | {:ok, Token}
  def new do
    {username, password} = {get_env(:reydenx, :username), get_env(:reydenx, :password)}
    new({username, password})
  end

  @doc """
  Sends a request to obtain an API access token

  See: [API Documentation](https://api.reyden-x.com/docs#/Token/Get_authorization_token_v1_token__post)

  ## Examples:

    ### Success:

      iex> Reydenx.new({"some_username", "secret_password"})
      {:ok, %Reydenx.Model.Token{
        access_token: "XXX",
        token_type: "bearer",
        expires_in: "2024-01-01T10:00:00.049560+00:00"
      }}

    ### Fail

      iex> Reydenx.new({"some_username", "secret_password"})
      {:error, %Reydenx.Model.ResponseError{
        path: "/token/",
        status_code: 429,
        message: "Retry After: 7"
      }}
  """
  @doc since: "0.1.0"
  @spec new({username :: String.t(), password :: String.t()}) ::
          {:error, ResponseError} | {:ok, Token}
  def new({username, password}), do: token_request(username, password)

  @doc false
  @spec token_request(username :: String.t(), password :: String.t()) ::
          {:error, ResponseError} | {:ok, Token}
  defp token_request(username, password)
       when is_valid_string(username) and is_valid_string(password) do
    token_path = "/token/"

    http_client().post(
      "#{@base_url}#{token_path}",
      {:form, [{"username", username}, {"password", password}]}
    )
    |> Response.handler(token_path, Token)
  end
end
