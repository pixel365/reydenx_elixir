defmodule Reydenx.Model.ActionResult do
  @derive {Jason.Encoder, only: [:request_id, :order_id, :action, :value, :task]}
  defstruct [
    :request_id,
    :order_id,
    :action,
    :value,
    :task
  ]
end
