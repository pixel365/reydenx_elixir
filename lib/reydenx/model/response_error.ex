defmodule Reydenx.Model.ResponseError do
  @derive {Jason.Encoder, only: [:path, :status_code, :message]}
  defstruct [:path, :status_code, :message]
end
