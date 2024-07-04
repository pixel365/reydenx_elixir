defmodule Reydenx.User do
  @moduledoc """
  Provides access to methods for obtaining account and balance information
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.Client
  alias Reydenx.Model.{Balance, User, Token, ResponseError}
  import Reydenx.Guards

  @prefix "/user/"

  @doc """
  User Account

  [API Documentation](https://api.reyden-x.com/docs#/User/get_user_v1_user__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.User.account(token)
      {:ok, %Reydenx.Model.User{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.User.account(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec account(token :: %Token{}) :: {:error, %ResponseError{}} | {:ok, %User{}}
  def account(token) when is_valid_token(token), do: Client.get(token, @prefix, User)

  @doc """
  User Balance

  [API Documentation](https://api.reyden-x.com/docs#/User/get_balance_v1_user_balance__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.User.balance(token)
      {:ok, %Reydenx.Model.User{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.User.balance(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec balance(token :: %Token{}) :: {:error, %ResponseError{}} | {:ok, %Balance{}}
  def balance(token) when is_valid_token(token),
    do: Client.get(token, "#{@prefix}balance/", Balance)
end
