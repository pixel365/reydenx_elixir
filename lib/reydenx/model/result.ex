defmodule Reydenx.Model.Result do
  @derive {Jason.Encoder, only: [:request_id, :cached, :cache_expires_at, :cursor, :result]}
  defstruct [
    :request_id,
    :cached,
    :cache_expires_at,
    :cursor,
    result: []
  ]
end
