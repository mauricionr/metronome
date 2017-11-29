defmodule Bot.Application do
  # See http://elixir-lang.org/docs/stable/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  alias Bot.Metronome
  alias Bot.ControllerServer

  def start(_type, _args) do
    "[APPLICATION START]" |> IO.puts
    import Supervisor.Spec, warn: false

    # Define workers and child supervisors to be supervised
    children = [
      # Bot.Worker.start_link(arg1, arg2, arg3)
      # worker(Bot.Worker, [arg1, arg2, arg3]),
      worker(Metronome, [ControllerServer], restart: :permanent)      
    ]

    # See http://elixir-lang.org/docs/stable/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Bot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
