defmodule UserTest do
  alias Reydenx.Model.{Token, User, Balance}
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  test ":ok account" do
    response = %HTTPoison.Response{
      status_code: 200,
      body:
        "{\"id\":123,\"username\":\"JohnDoe\",\"date_joined\":\"2022-01-19T09:51:13+00:00\",\"email\":\"johndoe@johndoe.com\",\"is_active\":true,\"is_blocked\":false,\"has_image\":false,\"image_extension\":null,\"image_url\":\"\",\"currency_id\":1,\"discount_value\":0,\"is_reseller\":true,\"twitch_id\":0,\"twitch_login\":\"\"}"
    }

    result = %User{
      id: 123,
      username: "JohnDoe",
      date_joined: "2022-01-19T09:51:13+00:00",
      email: "johndoe@johndoe.com",
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
    }

    expect(HTTPoison.BaseMock, :get, fn _path, _body -> {:ok, response} end)

    assert {:ok, ^result} = token() |> Reydenx.User.account()
  end

  test ":ok balance" do
    response = %HTTPoison.Response{
      status_code: 200,
      body:
        "{\"id\":123,\"amount\":1500.27,\"currency_id\":1,\"user_id\":123456,\"formatted_amount\":1500.27,\"currency\":\"USD\"}"
    }

    result = %Balance{
      id: 123,
      amount: 1500.27,
      currency_id: 1,
      user_id: 123_456,
      formatted_amount: 1500.27,
      currency: "USD"
    }

    expect(HTTPoison.BaseMock, :get, fn _path, _body -> {:ok, response} end)

    assert {:ok, ^result} = token() |> Reydenx.User.balance()
  end

  defp token do
    %Token{
      access_token: "XXX",
      token_type: "bearer",
      expires_in: DateTime.utc_now() |> DateTime.add(3600, :second)
    }
  end
end
