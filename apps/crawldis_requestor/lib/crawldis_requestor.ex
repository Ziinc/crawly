defmodule CrawldisRequestor do
  use GenServer
  require Logger

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end
  @impl true
  def init(_) do
    Logger.info("Requestor started")
    ping()
    {:ok,[]}
  end

  @impl true
  def handle_info(:ping, state) do
    ping()
    {:noreply, state}
  end
  defp ping do
    Logger.info("Connected to #{inspect(Node.list())}")
    Process.send_after(self(), :ping, 2000)
  end
end
