defmodule CrawldisProcessor.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    # topologies = [
    #   default: [
    #     strategy: Cluster.Strategy.Gossip
    #   ]
    # ]
    children = [
      # Starts a worker by calling: CrawldisProcessor.Worker.start_link(arg)
      # {CrawldisProcessor.Worker, arg}
      CrawldisProcessor,
      # {Cluster.Supervisor, [topologies, [name: CrawldisCommon.LibClusterSup]]},
      CrawldisCommon.ClusterSup
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrawldisProcessor.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
