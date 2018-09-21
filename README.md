# MyLoggerApp

Example app that illustrates the timeout error when removing a logger from `Application.stop/1`.

## Recreating the issue

```
my_logger_app master % iex -S mix
Erlang/OTP 21 [erts-10.0.5] [source] [64-bit] [smp:8:8] [ds:8:8:10] [async-threads:1] [hipe]

Compiling 1 file (.ex)
Interactive Elixir (1.7.3) - press Ctrl+C to exit (type h() ENTER for help)
iex(1)> Application.stop(:my_logger_app)
:ok
iex(2)>
08:51:55.831 [info]  Application my_logger_app exited: :stopped

08:51:55.835 [error] :gen_event handler Logger.Config installed in Logger terminating
** (stop) exited in: :gen_server.call(:application_controller, {:set_env, :logger, :backends, [:console], []}, 5000)
    ** (EXIT) time out
Last message: {:remove_backend, MyLoggerApp.LoggerBackend}
State: {%{level: :debug, mode: :async, translators: [{Logger.Translator, :translate}], truncate: 8096, utc_log: false}, %{async_threshold: 15, discard_threshold: 500, keep_threshold: 375, sync_threshold: 20}}

08:51:55.836 [error] GenServer #PID<0.135.0> terminating
** (stop) {:EXIT, {:timeout, {:gen_server, :call, [:application_controller, {:set_env, :logger, :backends, [:console], []}, 5000]}}}
Last message: {:gen_event_EXIT, Logger.Config, {:EXIT, {:timeout, {:gen_server, :call, [:application_controller, {:set_env, :logger, :backends, [:console], []}, 5000]}}}}
State: {Logger, Logger.Config}
```
