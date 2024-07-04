defmodule Reydenx.Model.Token do
  @derive {Jason.Encoder, only: [:access_token, :token_type, :expires_in]}
  defstruct [:access_token, :token_type, :expires_in]
end
