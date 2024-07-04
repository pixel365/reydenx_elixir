defmodule Reydenx.Model.Price do
  alias Reydenx.Model.MinMaxStep

  @derive {Jason.Encoder,
           only: [
             :id,
             :name,
             :format,
             :price,
             :description,
             :category_id,
             :views,
             :online_viewers
           ]}
  defstruct [
    :id,
    :name,
    :format,
    :price,
    :description,
    :category_id,
    views: %MinMaxStep{},
    online_viewers: %MinMaxStep{}
  ]
end
