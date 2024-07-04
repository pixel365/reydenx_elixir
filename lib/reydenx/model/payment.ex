defmodule Reydenx.Model.Payment do
  @derive {Jason.Encoder,
           only: [
             :id,
             :created_at,
             :updated_at,
             :payed_at,
             :order_id,
             :amount,
             :external_id,
             :uuid,
             :receipt
           ]}
  defstruct [
    :id,
    :created_at,
    :updated_at,
    :payed_at,
    :order_id,
    :amount,
    :external_id,
    :uuid,
    :receipt
  ]
end
