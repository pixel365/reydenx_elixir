defmodule Reydenx.Model.Task do
  @derive {Jason.Encoder, only: [:id, :url, :expires_at]}
  defstruct [:id, :url, :expires_at]
end
