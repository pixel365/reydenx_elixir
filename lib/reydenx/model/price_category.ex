defmodule Reydenx.Model.PriceCategory do
  @derive {Jason.Encoder, only: [:id, :is_active, :name, :description]}
  defstruct [:id, :is_active, :name, :description]
end
