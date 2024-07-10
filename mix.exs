defmodule Reydenx.MixProject do
  use Mix.Project

  @source_url "https://github.com/pixel365/reydenx_elixir"
  @version "0.1.2"

  def project do
    [
      app: :reydenx,
      version: @version,
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      name: "Reyden-X",
      description: description(),
      deps: deps(),
      docs: docs(),
      package: package()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:jason, "~> 1.4"},
      {:httpoison, "~> 2.2"},
      {:mox, "~> 1.0.2", only: :test},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      maintainers: ["Ruslan Semagin"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url}
    ]
  end

  defp docs do
    [
      main: "readme",
      name: "Reyden-X",
      canonical: "http://hexdocs.pm/reydenx",
      source_ref: "v#{@source_url}",
      source_url: @source_url,
      extras: ["README.md", "LICENSE"]
    ]
  end

  defp description do
    """
    Reyden-X is an automated service for promoting live broadcasts on external sites with integrated system of viewers and views management
    """
  end
end
