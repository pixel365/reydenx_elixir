defmodule Reydenx.Response do
  alias Reydenx.Utils
  alias Reydenx.Model.{ResponseError, ActionResult, Result}
  import Reydenx.Guards

  @ok 200
  @bad_request 400
  @unauthorized 401
  @forbidden 403
  @not_found 404
  @method_not_allowed 405
  @unprocessable_entity 422
  @too_many_requests 429
  @internal_error 500
  @possible_errors [
    @bad_request,
    @unauthorized,
    @forbidden,
    @not_found,
    @method_not_allowed,
    @unprocessable_entity,
    @internal_error
  ]
  @error_codes %{
    "#{@bad_request}" => "Bad Request",
    "#{@unauthorized}" => "Unautorized",
    "#{@forbidden}" => "Forbidden",
    "#{@not_found}" => "Not Found",
    "#{@method_not_allowed}" => "Method Not Allowed",
    "#{@unprocessable_entity}" => "Unprocessable Entity",
    "#{@internal_error}" => "Internal Error"
  }

  def handler({:ok, response}, to) when is_result(response) do
    response = %Result{
      request_id: response.request_id,
      cached: response.cached,
      cache_expires_at: response.cache_expires_at,
      cursor: response.cursor,
      result: parse_result(response.result, to)
    }

    {:ok, response}
  end

  def handler({:ok, response}, to) when is_action_result(response) do
    response = %ActionResult{
      request_id: response.request_id,
      order_id: response.order_id,
      action: response.action,
      value: response.value,
      task: parse_result(response.task, to)
    }

    {:ok, response}
  end

  def handler({:error, error}, _to), do: {:error, error}

  def handler({:error, %HTTPoison.Error{reason: reason}}, _, _),
    do: {:error, %ResponseError{path: "", status_code: @internal_error, message: reason}}

  def handler({:ok, %HTTPoison.Response{status_code: @ok, body: body}}, _, to) do
    case Jason.decode(body) do
      {:ok, result} ->
        {:ok, struct(to, Enum.map(result, fn {k, v} -> Utils.map({k, v}) end))}

      {:error, error} ->
        handler({:error, error})
    end
  end

  def handler(
        {:ok, %HTTPoison.Response{status_code: @too_many_requests, body: body}},
        path,
        _
      ) do
    case Jason.decode(body) do
      {:ok, result} ->
        retry_after = Map.get(result, "retry_after", 0)

        {:error,
         %ResponseError{
           path: path,
           status_code: @too_many_requests,
           message: "Retry After: #{retry_after}"
         }}

      {:error, error} ->
        handler({:error, error})
    end
  end

  def handler({:ok, %HTTPoison.Response{status_code: status_code}}, path, _)
      when status_code in @possible_errors do
    {:error,
     %ResponseError{
       path: path,
       status_code: status_code,
       message: Map.get(@error_codes, Integer.to_string(status_code), "Unknown Error")
     }}
  end

  def handler({:ok, result}), do: {:ok, result}
  def handler({:error, error}), do: {:error, error}

  defp parse_result(result, to) when is_list(result) do
    for m <- result do
      struct(to, Enum.map(m, fn {k, v} -> Utils.map({k, v}) end))
    end
  end

  defp parse_result(result, to) when is_map(result) do
    struct(to, Enum.map(result, fn {k, v} -> Utils.map({k, v}) end))
  end
end
