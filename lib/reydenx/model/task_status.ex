defmodule Reydenx.Model.TaskStatus do
  @derive {Jason.Encoder, only: [:status, :details]}
  defstruct [:status, :details]
end
