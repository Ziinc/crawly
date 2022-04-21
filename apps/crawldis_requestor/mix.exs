defmodule CrawldisRequestor.MixProject do
  use Mix.Project

  def project do
    [
      app: :crawldis_requestor,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      build_path: "../../_build",
      config_path: "../../config/config.exs",
      deps_path: "../../deps",
      lockfile: "../../mix.lock",
      aliases: aliases()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {CrawldisRequestor.Application, []}

    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
      {:crawldis_common, in_umbrella: true},
      {:crawly, in_umbrella: true},
    ]
  end
  defp aliases do
    [
      setup: "cmd echo pass"
    ]
  end
end
