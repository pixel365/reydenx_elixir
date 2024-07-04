defmodule Reydenx.Guards do
  alias Reydenx.Model.{ActionResult, Result, Token}
  import :erlang, only: [map_get: 2]

  defguard is_valid_string(value) when is_binary(value) and value != ""

  defguard is_valid_result(result)
           when is_struct(result) and map_get(:__struct__, result) in [Result, ActionResult]

  defguard is_result(result)
           when is_struct(result) and map_get(:__struct__, result) == Result

  defguard is_action_result(result)
           when is_struct(result) and map_get(:__struct__, result) == ActionResult

  defguard is_valid_token(token)
           when is_struct(token) and map_get(:__struct__, token) == Token

  defguard is_gt(lhs, rhs \\ 0) when is_integer(lhs) and is_integer(rhs) and lhs > rhs
end
