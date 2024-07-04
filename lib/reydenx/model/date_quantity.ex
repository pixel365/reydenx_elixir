defmodule Reydenx.Model.DateQuantity do
  @derive {Jason.Encoder, only: [:date, :quantity]}
  defstruct [:date, :quantity]
end
