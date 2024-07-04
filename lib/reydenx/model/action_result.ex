defmodule Reydenx.Model.ActionResult do
  alias Reydenx.Model.Task

  @derive {Jason.Encoder, only: [:request_id, :order_id, :action, :value, :task]}
  defstruct [
    :request_id,
    :order_id,
    :action,
    :value,
    task: %Task{}
  ]
end
