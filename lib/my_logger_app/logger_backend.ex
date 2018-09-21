defmodule MyLoggerApp.LoggerBackend do
  @moduledoc false

  @behaviour :gen_event

  def init(_), do: {:ok, nil}

  def handle_call({:configure, _options}, state), do: {:ok, :ok, state}

  def handle_event(_, state), do: {:ok, state}

  def handle_info(_, state), do: {:ok, state}
end
