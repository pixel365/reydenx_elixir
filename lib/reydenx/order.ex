defmodule Reydenx.Order do
  @moduledoc """
  Provides methods for working with orders
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.{Client, Response}

  alias Reydenx.Model.{
    ResponseError,
    IdQuantity,
    Online,
    DomainStat,
    DateQuantity,
    Payment,
    Order,
    Token,
    Result
  }

  import Reydenx.Guards

  @prefix "/orders/"

  @type t :: %Token{}
  @type res :: {:error, %ResponseError{}} | {:ok, %Result{}}

  @doc """
  All Orders

  [API Documentation](https://api.reyden-x.com/docs#/Orders/orders_v1_orders__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.all(token)
      {:ok, %Reydenx.Model.Result{
        request_id: "aeB9_Wdm_dnt43gKSU_WXQ1720074136.561463",
        cached: true,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: "XXX",
        result: [
          %Reydenx.Model.Order{
            id: 123456,
            created_at: ~U[2024-01-01T10:00:00.049560Z],
            updated_at: ~U[2024-01-01T10:00:00.049560Z],
            uuid: "4f2ba79b-8c36-4651-84ca-ca6cc0df42cf",
            status: "closed",
            ordered_view_qty: 10000,
            price_per_view: 0.1,
            is_autostart: true,
            online_users_limit: 1000,
            tariff_id: 123456,
            platform: "twitch",
            content_type: "stream",
            parameters: %{
              "delay" => false,
              "delay_time" => 0,
              "even_distribution" => false,
              "even_distribution_time" => 0,
              "launch_mode" => "auto",
              "work_mode" => "with-stream"
            },
            extras: %{
              "game_name" => nil,
              "image_url" => "XXX",
              "twitch_channel" => "channel",
              "twitch_id" => 123456
            },
            statistics: nil,
            content_classification_labels: [
              "MatureGame",
              "ViolentGraphic"
            ]
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.all(token)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec all(token :: t()) :: res()
  def all(token), do: r(token, "", Order)

  @doc since: "0.1.0"
  @spec all(token :: t(), cursor :: String.t()) :: res()
  def all(token, cursor) when is_valid_string(cursor),
    do: r(token, "?cursor=#{cursor}", Order)

  @doc """
  Detailed Order Information

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_details_v1_orders__order_id___get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.details(token, 123456)
      {:ok, %Reydenx.Model.Result{
        request_id: "DvXr4OjdKgHHrH0NNkmvzw1720075199.128009",
        cached: true,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: %Reydenx.Model.Order{
          id: 123456,
          created_at: ~U[2024-01-01T10:00:00.049560Z],
          updated_at: ~U[2024-01-01T10:00:00.049560Z],
          uuid: "e67d9c84-bced-4a8e-b448-00bbf5c49d29",
          status: "closed",
          ordered_view_qty: 1000,
          price_per_view: 0.2,
          is_autostart: true,
          online_users_limit: 100,
          tariff_id: 123456,
          platform: "twitch",
          content_type: "stream",
          parameters: %{
            "delay" => false,
            "delay_time" => 0,
            "even_distribution" => false,
            "even_distribution_time" => 0,
            "launch_mode" => "manual",
            "work_mode" => "with-stream"
          },
          extras: %{
            "game_name" => nil,
            "image_url" => "XXX",
            "twitch_channel" => "channel",
            "twitch_id" => 123456
          },
          statistics: %{
            "active_time_in_seconds" => 0,
            "average" => %{
              "online" => %{"in_fact" => 0, "in_settings" => 0},
              "session_in_seconds" => 0
            },
            "clicks" => 23,
            "ctr" => 2.1,
            "views" => 1091
          },
          content_classification_labels: []
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.details(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec details(token :: t(), order_id :: pos_integer()) :: res()
  def details(token, order_id), do: r(token, order_id, "/", Order)

  @doc """
  Order Payments

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_payments_v1_orders__order_id__payments__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.payments(token, 123456)
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.Payment{
            id: 123456,
            created_at: ~U[2024-01-01T10:00:00.049560Z],
            updated_at: ~U[2024-01-01T10:00:00.049560Z],
            payed_at: ~U[2024-01-01T10:00:00.049560Z],
            order_id: 123456,
            amount: 1000.0,
            external_id: "XXX",
            uuid: "e67d9c84-bced-4a8e-b448-00bbf5c49d29",
            receipt: nil
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.payments(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec payments(token :: t(), order_id :: pos_integer()) :: res()
  def payments(token, order_id),
    do: r(token, order_id, "/payments/", Payment)

  @doc since: "0.1.0"
  @spec payments(token :: t(), order_id :: pos_integer(), cursor :: String.t()) :: res()
  def payments(token, order_id, cursor) when is_valid_string(cursor),
    do: r(token, order_id, "/payments/?cursor=#{cursor}", Payment)

  @doc """
  Detailed Information about Users Online

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_stats_online_v1_orders__order_id__statistics_online__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.online(token, 123456)
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.Online{
            created_at: ~U[2024-01-01T10:00:00.049560Z],
            in_settings: 1000,
            in_fact: 998
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.online(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec online(token :: t(), order_id :: pos_integer()) :: res()
  def online(token, order_id),
    do: r(token, order_id, "/statistics/online/", Online)

  @doc """
  Detailed Information about Clicks

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_stats_clicks_v1_orders__order_id__statistics_clicks__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.clicks(token, 123456)
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.DateQuantity{
            date: "2022-05-30",
            quantity: 30
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.clicks(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec clicks(token :: t(), order_id :: pos_integer()) :: res()
  def clicks(token, order_id),
    do: r(token, order_id, "/statistics/clicks/", DateQuantity)

  @doc """
  Detailed Information about Views

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_stats_views_v1_orders__order_id__statistics_views__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.views(token, 123456)
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.DateQuantity{
            date: "2022-05-30",
            quantity: 1000
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.views(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec views(token :: t(), order_id :: pos_integer()) :: res()
  def views(token, order_id),
    do: r(token, order_id, "/statistics/views/", DateQuantity)

  @doc """
  Detailed Information about Sites

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_stats_sites_v1_orders__order_id__statistics_sites__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.sites(token, 123456)
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.DomainStat{
            domain: "example.com",
            views: 100,
            clicks: 3,
            ctr: 3.0
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.sites(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec sites(token :: t(), order_id :: pos_integer()) :: res()
  def sites(token, order_id),
    do: r(token, order_id, "/statistics/sites/", DomainStat)

  @doc """
  View statistics for multiple orders. Click-through statistics for multiple orders.

  [API Documentation (Views)](https://api.reyden-x.com/docs#/Orders/multiple_views_v1_orders_multiple_views__post)

  [API Documentation (Clicks)](https://api.reyden-x.com/docs#/Orders/multiple_clicks_v1_orders_multiple_clicks__post)

  ## Examples:

    ### Success:

      Views:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.multiple(token, :views, [123456])
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.IdQuantity{
            id: 123456,
            quantity: 1000
          }
        ]
      }}

      Clicks:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.multiple(token, :clicks, [123456])
      {:ok, %Reydenx.Model.Result{
        request_id: "aE4SaOdwC1to94KdLpnOdA1720076109.665816",
        cached: false,
        cache_expires_at: "2024-01-01T10:00:00.049560+00:00",
        cursor: nil,
        result: [
          %Reydenx.Model.IdQuantity{
            id: 123456,
            quantity: 35
          }
        ]
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Order.multiple(token, :views, [123456])
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec multiple(token :: t(), stat_type :: atom(), identifiers :: list(pos_integer())) :: res()
  def multiple(token, stat_type, identifiers)
      when is_list(identifiers) and stat_type in [:views, :clicks] do
    ids =
      Enum.filter(identifiers, fn id -> is_integer(id) end)
      |> Enum.uniq()
      |> Enum.take(100)

    path = "#{@prefix}multiple/#{Atom.to_string(stat_type)}/"

    if ids != [] do
      Client.post(token, path, %{identifiers: ids}) |> Response.handler(IdQuantity)
    else
      {:error, %ResponseError{path: path, status_code: 400, message: ""}}
    end
  end

  # TODO: implement order creation

  @doc false
  defp r(token, path, to) when is_valid_token(token) do
    Client.get(token, "#{@prefix}#{path}") |> Response.handler(to)
  end

  @doc false
  defp r(token, order_id, path, to) when is_valid_token(token) and is_gt(order_id, 0) do
    Client.get(token, "#{@prefix}#{order_id}#{path}") |> Response.handler(to)
  end
end
