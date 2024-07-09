# Reydenx

Reyden-X is an automated service for promoting live broadcasts on external sites with integrated system of viewers and views management

## Installation

```elixir
def deps do
  [
    {:reydenx, "~> 0.1.1"}
  ]
end
```

## Basic Usage

```elixir
iex(1)> {:ok, token} = Reydenx.new()
{:ok,
 %Reydenx.Model.Token{
   access_token: "XXX",
   token_type: "bearer",
   expires_in: ~U[2024-07-05 19:31:54.931770Z]
}}
iex(2)> {:ok, account} = Reydenx.User.account(token)
{:ok,
 %Reydenx.Model.User{
  id: 123456,
  username: "someusername",
  date_joined: "2022-01-19T09:51:13+00:00",
  email: "someuseremail@gmail.com",
  is_active: true,
  is_blocked: false,
  has_image: false,
  image_extension: nil,
  image_url: "",
  currency_id: 1,
  discount_value: 0,
  is_reseller: true,
  twitch_id: 0,
  twitch_login: ""   
}}
```

## Environment Variables

|Name|Description|Required|
|---|---|---|
|REYDENX_EMAIL|Reyden-X Email|No|
|REYDENX_PASSWORD|Reyden-X Password|No|

Full documentation: https://hexdocs.pm/reydenx
