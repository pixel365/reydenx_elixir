defmodule Reydenx.Client do
  @moduledoc """
  A wrapper for 'HTTPoison'. Used to obtain an API access token, implements the 'GET', 'POST', 'PATCH' methods
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.Model.{Result, User, Balance, ResponseError, ActionResult}
  alias Reydenx.Response
  import Reydenx.{Guards, Utils}

  @base_url "https://api.reyden-x.com/v1"

  @type t ::
          {:error, %ResponseError{}} | {:ok, %ActionResult{} | %Result{} | %User{} | %Balance{}}
  @type s :: String.t()

  @doc """
  GET Request
  """
  @doc since: "0.1.0"
  @spec get(token :: Token, path :: s(), to :: Result | any()) :: t()
  def get(token, path, to \\ Result)
      when is_valid_token(token) and is_valid_string(path) do
    http_client().get("#{@base_url}#{path}", Authorization: "Bearer #{token.access_token}")
    |> Response.handler(path, to)
  end

  @doc """
  PATCH Request
  """
  @doc since: "0.1.0"
  @spec patch(token :: Token, path :: s(), to :: ActionResult | any()) :: t()
  def patch(token, path, to) when is_valid_token(token) and is_valid_string(path) do
    http_client().patch("#{@base_url}#{path}", nil, Authorization: "Bearer #{token.access_token}")
    |> Response.handler(path, to)
  end

  @doc since: "0.1.1"
  @spec patch(token :: Token, path :: s(), body :: map(), to :: ActionResult | any()) ::
          t()
  def patch(token, path, body, to) when is_valid_token(token) and is_valid_string(path) do
    {_, body} = Jason.encode(body)

    http_client().patch("#{@base_url}#{path}", body, %{
      Authorization: "Bearer #{token.access_token}",
      "Content-Type": "application/json"
    })
    |> Response.handler(path, to)
  end

  @doc """
  POST Request
  """
  @doc since: "0.1.0"
  @spec post(token :: Token, path :: s(), body :: map()) :: t()
  def post(token, path, body)
      when is_valid_token(token) and is_valid_string(path) and is_map(body) do
    {_, body} = Jason.encode(body)

    http_client().post("#{@base_url}#{path}", body, %{
      Authorization: "Bearer #{token.access_token}",
      "Content-Type": "application/json"
    })
    |> Response.handler(path, Result)
  end
end
