defmodule Reydenx.Action do
  @moduledoc """
  Provides access to order statistics methods, methods for changing the status of orders, as well as for checking the status of jobs
  """
  @moduledoc since: "0.1.0"

  alias Reydenx.{Client, Response}
  alias Reydenx.Model.{TaskStatus, ActionResult, Task, Token, ResponseError}
  import Reydenx.Guards

  @prefix "/orders"

  @type t :: {:error, %ResponseError{}} | {:ok, %ActionResult{}}
  @type p :: pos_integer()

  @doc """
  Run Order

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_run_v1_orders__order_id__action_run__patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.run(token, 123456)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "run",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.run(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec run(token :: %Token{}, order_id :: p()) :: t()
  def run(token, order_id), do: r(token, order_id, "action/run/")

  @doc """
  Stop Order

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_stop_v1_orders__order_id__action_stop__patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.stop(token, 123456)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "stop",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.stop(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec stop(token :: %Token{}, order_id :: p()) :: t()
  def stop(token, order_id), do: r(token, order_id, "action/stop/")

  @doc """
  Cancel Order

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_cancel_v1_orders__order_id__action_cancel__patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.cancel(token, 123456)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "cancel",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.cancel(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec cancel(token :: %Token{}, order_id :: p()) :: t()
  def cancel(token, order_id), do: r(token, order_id, "action/cancel/")

  @doc """
  Change the Number of Viewers

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_change_online_v1_orders__order_id__action_change_online__value___patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_online(token, 123456, 1000)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "change:online",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_online(token, 123456, 1000)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec change_online(token :: %Token{}, order_id :: p(), value :: p()) :: t()
  def change_online(token, order_id, value) when is_gt(value),
    do: r(token, order_id, "action/change/online/#{value}/")

  @doc """
  Change the time of the smooth set of viewers

  [API Documentation](https://api.reyden-x.com/docs#/Orders/change_increase_value_v1_orders__order_id__action_increase_change__value___patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_increase(token, 123456, 1000)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "change:increase:value",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_increase(token, 123456, 1000)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec change_increase(token :: %Token{}, order_id :: p(), value :: p()) :: t()
  def change_increase(token, order_id, value) when is_gt(value),
    do: r(token, order_id, "action/increase/change/#{value}/")

  @doc """
  Enable smooth increase of viewers

  [API Documentation](https://api.reyden-x.com/docs#/Orders/increase_on_v1_orders__order_id__action_increase_on__value___patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.increase_on(token, 123456, 1000)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "increase:on",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.increase_on(token, 123456, 1000)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec increase_on(token :: %Token{}, order_id :: p(), value :: p()) :: t()
  def increase_on(token, order_id, value) when is_gt(value),
    do: r(token, order_id, "action/increase/on/#{value}/")

  @doc """
  Disable smooth increase of viewers

  [API Documentation](https://api.reyden-x.com/docs#/Orders/increase_off_v1_orders__order_id__action_increase_off__patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.increase_off(token, 123456)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "increase:off",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.increase_off(token, 123456)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec increase_off(token :: %Token{}, order_id :: p()) :: t()
  def increase_off(token, order_id), do: r(token, order_id, "action/increase/off/")

  @doc """
  Add Views to Order

  [API Documentation](https://api.reyden-x.com/docs#/Orders/add_views_v1_orders__order_id__action_add_views__value___patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.add_views(token, 123456, 1000)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "add:views",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.add_views(token, 123456, 1000)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec add_views(token :: %Token{}, order_id :: p(), value :: p()) :: t()
  def add_views(token, order_id, value) when is_gt(value),
    do: r(token, order_id, "action/add/views/#{value}/")

  @doc """
  Change Launch Parameters

  [API Documentation](https://api.reyden-x.com/docs#/Orders/change_launch_params_v1_orders__order_id__action_change_launch__patch)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_launch_mode(token, 123456, :auto)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "change:launch",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_launch_mode(token, 123456, :manual)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "change:launch",
        value: nil,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_launch_mode(token, 123456, :delay, 60)
      {:ok, %Reydenx.Model.ActionResult{
        request_id: "",
        order_id: 123456,
        action: "change:launch",
        value: 60,
        task: %Reydenx.Model.Task{
          id: "h_Hg_ZWcjqRN2sd9GScBqg",
          url: "https://api.reyden-x.com/v1/orders/123456/task/h_Hg_ZWcjqRN2sd9GScBqg/status/",
          expires_at: "2024-07-09T09:21:29.577065+00:00"
        }
      }}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.change_launch_mode(token, 123456, :auto)
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.1"
  @spec change_launch_mode(token :: %Token{}, order_id :: p(), mode :: :auto | :manual) :: t()
  def change_launch_mode(token, order_id, mode)
      when is_valid_token(token) and is_gt(order_id) and mode in [:auto, :manual] do
    params = %{"mode" => mode, "value" => 0}

    patch(token, order_id, params)
  end

  @doc since: "0.1.1"
  @spec change_launch_mode(token :: %Token{}, order_id :: p(), mode :: :delay, value :: p()) ::
          t()
  def change_launch_mode(token, order_id, mode, value)
      when is_valid_token(token) and is_gt(order_id) and is_gt(value) and mode == :delay do
    params = %{"mode" => "delay", "value" => 0}

    patch(token, order_id, params)
  end

  @doc """
  Check the Task Status

  [API Documentation](https://api.reyden-x.com/docs#/Orders/order_get_task_status_v1_orders__order_id__task__task_id__status__get)

  ## Examples:

    ### Success:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.task_status(token, "some_task_id")
      {:ok, %Reydenx.Model.TaskStatus{}}

    ### Fail:

      iex> {:ok, token} = Reydenx.new()
      iex> Reydenx.Action.task_status(token, "some_task_id")
      {:error, %Reydenx.Model.ResponseError{
        path: "/",
        status_code: 404,
        message: "Not Found"
      }}
  """
  @doc since: "0.1.0"
  @spec task_status(token :: %Token{}, order_id :: p(), task_id :: String.t()) ::
          {:error, ResponseError} | {:ok, TaskStatus}
  def task_status(token, order_id, task_id)
      when is_valid_token(token) and is_gt(order_id) and is_valid_string(task_id) do
    Client.get(token, "#{@prefix}/#{order_id}/task/#{task_id}/status/", TaskStatus)
  end

  @doc false
  defp patch(token, order_id, params) do
    Client.patch(token, "#{@prefix}/#{order_id}/action/change/launch/", params, ActionResult)
    |> Response.handler(Task)
  end

  @doc false
  defp r(token, order_id, path) when is_valid_token(token) and is_gt(order_id) do
    Client.patch(token, "#{@prefix}/#{order_id}/#{path}", ActionResult)
    |> Response.handler(Task)
  end
end
