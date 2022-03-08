# Run the code:- iex 02-my-genserver.exs
# Spawn the process:- pid =spawn(MyGenServer, :start, [])
# output :- #PID<0.114.0>

# To check Process is running :- Process.alive?(pid)
# output :- true

# send the message :- send pid, {:store, 23}
# output :- {:store, 23}

# send one more message :- send pid, {:store, "elixir"}
# output :- {:store, "elixir"}

# For get the pid for iex :- iex_pid = self()
# output :- #PID<0.111.0>

# send message to this process from iex_pid process :- send pid, {:send_all_values, iex_pid}
# output :- {:send_all_values, #PID<0.111.0>}

# For reading the values from iex mailbox :- flush()
# output :- {:all_values, ["elixir", 23]}
#           :ok

# Stateful:Long running process. Should be able to handle messages and also state/data if needed
defmodule MyGenServer do
  def start do
    initial_state = []
    receive_messages(initial_state)
  end

  def receive_messages(state) do
    receive do
      msg ->
        {:ok, new_state} = handle_message(msg, state)
        receive_messages(new_state)
    end
  end

  # api
  def handle_message({:store, value}, state) do
    {:ok, [value | state]}
  end

  def handle_message({:send_all_values, pid}, state) do
    send(pid, {:all_values, state})
    {:ok, state}
  end
end
