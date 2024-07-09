defmodule Reydenx.Utils do
  alias Reydenx.Model.MinMaxStep

  @doc since: "0.1.0"
  @spec http_client() :: HTTPoison
  def http_client do
    Application.get_env(:reydenx, :http_client)
  end

  @doc false
  def map({k, v}) do
    case k do
      "views" ->
        if is_map(v) do
          {String.to_atom(k),
           struct(MinMaxStep, Enum.map(v, fn {k1, v1} -> {String.to_atom(k1), v1} end))}
        else
          {String.to_atom(k), v}
        end

      "online_viewers" ->
        {String.to_atom(k),
         struct(MinMaxStep, Enum.map(v, fn {k1, v1} -> {String.to_atom(k1), v1} end))}

      "created_at" ->
        {String.to_atom(k), str_to_datetime(v)}

      "updated_at" ->
        {String.to_atom(k), str_to_datetime(v)}

      "payed_at" ->
        {String.to_atom(k), str_to_datetime(v)}

      "expires_in" ->
        {String.to_atom(k), str_to_datetime(v)}

      _ ->
        {String.to_atom(k), v}
    end
  end

  @doc false
  @spec str_to_datetime(datetime :: String.t()) :: %DateTime{}
  defp str_to_datetime(datetime) do
    DateTime.from_iso8601(datetime) |> get_datetme()
  end

  defp get_datetme({:ok, datetime, _}), do: datetime
  defp get_datetme({:error, _}), do: ""
end
