defmodule Reydenx.Model.Traffic do
  @derive {Jason.Encoder, only: [:code, :quantity]}
  defstruct [:code, :quantity]
end
