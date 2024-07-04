defmodule Reydenx.Traffic do
  @moduledoc """
  Provides access to methods for obtaining information about current tariffs and tariff categories
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.{Client, Response}
  alias Reydenx.Model.{Traffic, Token, ResponseError, Result}
  import Reydenx.Guards

  @prefix "/traffic/"
  @countries :countries
  @languages :languages
  @devices :devices

  @doc """
  Traffic Statistics by Country

  [API Documentation](https://api.reyden-x.com/docs#/Traffic/Traffic_statistics_by_country_v1_traffic_countries__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Traffic.countries(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Traffic.countries(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec countries(token :: %Token{}) :: {:error, %ResponseError{}} | {:ok, %Result{}}
  def countries(token), do: r(token, @countries)

  @doc """
  Traffic Statistics by Language

  [API Documentation](https://api.reyden-x.com/docs#/Traffic/Traffic_statistics_by_language_v1_traffic_languages__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Traffic.languages(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Traffic.languages(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec languages(token :: %Token{}) :: {:error, %ResponseError{}} | {:ok, %Result{}}
  def languages(token), do: r(token, @languages)

  @doc """
  Traffic Statistics by Device

  [API Documentation](https://api.reyden-x.com/docs#/Traffic/Traffic_statistics_by_device_type_v1_traffic_devices__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Traffic.devices(token)
      {:ok, %Reydenx.Model.Result{}}

    ### Fail

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Traffic.devices(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec devices(token :: %Token{}) :: {:error, %ResponseError{}} | {:ok, %Result{}}
  def devices(token), do: r(token, @devices)

  @doc false
  defp r(token, type) when is_valid_token(token) and is_atom(type) do
    Client.get(token, "#{@prefix}#{Atom.to_string(type)}/") |> Response.handler(Traffic)
  end
end
