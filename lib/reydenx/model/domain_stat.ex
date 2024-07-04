defmodule Reydenx.Model.DomainStat do
  @derive {Jason.Encoder, only: [:domain, :views, :clicks, :ctr]}
  defstruct [:domain, :views, :clicks, :ctr]
end
