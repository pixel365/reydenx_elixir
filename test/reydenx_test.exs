defmodule ReydenxTest do
  alias Reydenx.Model.{ResponseError, Token}
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  test ":ok on 200" do
    response = %HTTPoison.Response{
      status_code: 200,
      body:
        "{\"request_id\":null,\"access_token\":\"XXX\",\"token_type\":\"bearer\",\"expires_in\":\"2024-07-04T11:50:52.482274+00:00\"}"
    }

    result = %Token{
      access_token: "XXX",
      token_type: "bearer",
      expires_in: ~U[2024-07-04 11:50:52.482274Z]
    }

    expect(HTTPoison.BaseMock, :post, fn _path, _body -> {:ok, response} end)

    assert {:ok, ^result} = Reydenx.new()
  end

  test ":error on 429" do
    response = %HTTPoison.Response{
      status_code: 429,
      body: "{}"
    }

    result = %ResponseError{
      path: "/token/",
      status_code: 429,
      message: "Retry After: 0"
    }

    expect(HTTPoison.BaseMock, :post, fn _path, _body -> {:ok, response} end)

    assert {:error, ^result} = Reydenx.new()
  end

  test ":error on 400" do
    response = %HTTPoison.Response{
      status_code: 400,
      body: "{}"
    }

    result = %ResponseError{
      path: "/token/",
      status_code: 400,
      message: "Bad Request"
    }

    expect(HTTPoison.BaseMock, :post, fn _path, _body -> {:ok, response} end)

    assert {:error, ^result} = Reydenx.new()
  end
end
