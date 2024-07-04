defmodule Reydenx.Model.User do
  @derive {Jason.Encoder,
           only: [
             :id,
             :username,
             :date_joined,
             :email,
             :is_active,
             :is_blocked,
             :has_image,
             :image_extension,
             :image_url,
             :currency_id,
             :discount_value,
             :is_reseller,
             :twitch_id,
             :twitch_login
           ]}
  defstruct [
    :id,
    :username,
    :date_joined,
    :email,
    :is_active,
    :is_blocked,
    :has_image,
    :image_extension,
    :image_url,
    :currency_id,
    :discount_value,
    :is_reseller,
    :twitch_id,
    :twitch_login
  ]
end
