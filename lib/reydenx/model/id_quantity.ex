defmodule Reydenx.Model.IdQuantity do
  @derive {Jason.Encoder, only: [:id, :quantity]}
  defstruct [:id, :quantity]
end
