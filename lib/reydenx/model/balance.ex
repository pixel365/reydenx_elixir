defmodule Reydenx.Model.Balance do
  @derive {Jason.Encoder,
           only: [:id, :amount, :currency_id, :user_id, :formatted_amount, :currency]}
  defstruct [
    :id,
    :amount,
    :currency_id,
    :user_id,
    :formatted_amount,
    :currency
  ]
end
