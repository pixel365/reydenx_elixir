defmodule Reydenx.Model.MinMaxStep do
  @derive {Jason.Encoder, only: [:min, :max, :step]}
  defstruct [:min, :max, :step]
end
