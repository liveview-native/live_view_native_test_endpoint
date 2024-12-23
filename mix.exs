defmodule LiveViewNativeTest.MixProject do
  use Mix.Project

  @version "0.4.0"

  def project do
    [
      app: :live_view_native_test_endpoint,
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
      {:phoenix_live_view, "~> 1.0.0-rc.8"},
    ]
  end
end
