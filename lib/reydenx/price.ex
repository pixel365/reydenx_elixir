defmodule Reydenx.Price do
  @moduledoc """
  Provides access to methods for obtaining current prices and fare categories
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.{Client, Response}
  alias Reydenx.Model.{PriceCategory, Price, Token, Result, ResponseError}
  import Reydenx.Guards

  @prefix "/prices"
  @twitch :twitch
  @youtube :youtube
  @goodgame :goodgame
  @trovo :trovo
  @vkplay :vkplay

  @type t() :: {:error, %ResponseError{}} | {:ok, %Result{}}

  @doc """
  All Prices for Twitch

  See: [API Documentation](https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.twitch(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.twitch(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec twitch(token :: %Token{}) :: t()
  def twitch(token), do: r(token, @twitch)

  @doc """
  All Prices for YouTube

  See: [API Documentation](https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.youtube(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.youtube(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec youtube(token :: %Token{}) :: t()
  def youtube(token), do: r(token, @youtube)

  @doc """
  All Prices for GoodGame

  See: [API Documentation](https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.goodgame(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.goodgame(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec goodgame(token :: %Token{}) :: t()
  def goodgame(token), do: r(token, @goodgame)

  @doc """
  All Prices for Trovo

  See: [API Documentation](https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.trovo(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.trovo(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec trovo(token :: %Token{}) :: t()
  def trovo(token), do: r(token, @trovo)

  @doc """
  All Prices for Vk Play

  See: [API Documentation](https://api.reyden-x.com/docs#/Prices/prices_v1_prices__platform_code___get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.vkplay(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.vkplay(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec vkplay(token :: %Token{}) :: t()
  def vkplay(token), do: r(token, @vkplay)

  @doc """
  All Price Categories

  See: [API Documentation](https://api.reyden-x.com/docs#/Price%20Categories/categories_v1_price_categories__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.categories(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Price.categories(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec categories(token :: %Token{}) :: t()
  def categories(token) when is_valid_token(token) do
    Client.get(token, "/price-categories/") |> Response.handler(PriceCategory)
  end

  @doc false
  defp r(token, platform)
       when is_valid_token(token) and
              platform in [@twitch, @youtube, @goodgame, @trovo, @vkplay] do
    Client.get(token, "#{@prefix}/#{Atom.to_string(platform)}/") |> Response.handler(Price)
  end
end
