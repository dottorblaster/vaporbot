defmodule Vaporbot.Mixfile do
  use Mix.Project

  def project do
    [
      app: :vaporbot,
      version: "0.0.1",
      elixir: "~> 1.4",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix, :gettext] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      mod: {Vaporbot.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.6"},
      {:phoenix_pubsub, "~> 2.0"},
      {:phoenix_html, "~> 3.0"},
      {:phoenix_live_view, "~> 0.18.0"},
      {:phoenix_live_reload, "~> 1.3", only: :dev},
      {:gettext, "~> 0.11"},
      {:plug_cowboy, "~> 2.5"},
      {:plug, "~> 1.13"},
      {:cowboy, "~> 2.9"},
      {:nadia, "~> 0.7.0"},
      {:jason, "~> 1.3"},
      {:vaporstring, "~> 1.0"},
      {:distillery, "~> 2.1"}
    ]
  end
end
