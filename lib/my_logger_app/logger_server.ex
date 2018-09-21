defmodule MyLoggerApp.LoggerServer do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, [])
  end

  def init([]) do
    Process.flag(:trap_exit, true)

    Logger.add_backend(MyLoggerApp.LoggerBackend)

    {:ok, nil}
  end

  def terminate(_reason, _state) do
    Logger.remove_backend(MyLoggerApp.LoggerBackend)
  end
end
