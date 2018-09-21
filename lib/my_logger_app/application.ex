defmodule MyLoggerApp.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    Logger.add_backend(MyLoggerApp.LoggerBackend)

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: MyLoggerApp.Worker.start_link(arg)
      # {MyLoggerApp.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MyLoggerApp.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def stop(_state) do
    Logger.remove_backend(MyLoggerApp.LoggerBackend)
  end
end
