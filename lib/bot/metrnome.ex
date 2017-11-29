defmodule Bot.Metronome do
  use GenServer

  @timeout 2000
  
  ## Client interface

  @spec start_link(pid, non_neg_integer, list) :: {:ok, pid}
  def start_link(callback_pid, timeout \\ @timeout, opts \\ []) do
    "[METRONOME] START_LINK" |> IO.puts        
    GenServer.start_link(__MODULE__, {callback_pid, timeout}, opts)
  end

  ## Server callbacks

  def init({_callback_pid, timeout} = state) do
    "[METRONOME] INIT" |> IO.puts    
    {:ok, state, timeout}
  end

  def handle_info(:timeout, {callback_pid, timeout} = state) do
    "[METRONOME] HANDLING INFO FOR #{callback_pid}" |> IO.puts            
    GenServer.cast(callback_pid, {:tick, DateTime.utc_now})
    {:noreply, state, timeout}
  end
  
end