defmodule LiveViewNativeTest.MixProject do
  use Mix.Project

  @version "0.3.0-alpha.3"

  def project do
    [
      app: :live_view_native_test,
      version: @version,
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix, "> 1.7.0"},
      # {:phoenix_live_view, path: "../phoenix_live_view", override: true},
      {:phoenix_live_view, github: "phoenixframework/phoenix_live_view", ref: "476d1cd288474d7acb33424a74b304b4e9495ff1", override: true},
    ]
  end
end
