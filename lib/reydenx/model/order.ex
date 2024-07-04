defmodule Reydenx.Model.Order do
  @derive {Jason.Encoder,
           only: [
             :id,
             :created_at,
             :updated_at,
             :uuid,
             :status,
             :ordered_view_qty,
             :price_per_view,
             :is_autostart,
             :online_users_limit,
             :tariff_id,
             :platform,
             :content_type,
             :parameters,
             :statistics,
             :content_classification_labels
           ]}
  defstruct [
    :id,
    :created_at,
    :updated_at,
    :uuid,
    :status,
    :ordered_view_qty,
    :price_per_view,
    :is_autostart,
    :online_users_limit,
    :tariff_id,
    :platform,
    :content_type,
    :parameters,
    :extras,
    :statistics,
    :content_classification_labels
  ]
end
