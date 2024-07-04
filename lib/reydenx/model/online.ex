defmodule Reydenx.Model.Online do
  @derive {Jason.Encoder, only: [:created_at, :in_settings, :in_fact]}
  defstruct [:created_at, :in_settings, :in_fact]
end
