defmodule Bot.ControllerServer do

  alias Bot.ControllerServer

  ## Client interface

  @spec start_link() :: {:ok, pid}  
  def start_link() do
    "[CONTROLLER SERVER] START LINK" |> IO.puts        
    GenServer.start_link(__MODULE__, [], [name: __MODULE__])
  end

  ## Server callbacks

  def init(_opts) do
    "[CONTROLLER SERVER] INIT" |> IO.puts    
    {:ok, nil}
  end

  @spec handle_cast(atom | {atom, any}, nil) :: {:noreply, nil}

  def handle_cast({:tick, now}, config) do
    "[CONTROLLER SERVER] HANDLING CAST" |> IO.puts
    {:ok, nil}
  end

end