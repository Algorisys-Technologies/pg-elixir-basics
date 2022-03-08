# To run the module :- iex 04-listen.always.exs

# spawn the process :- pid = spawn(Person, :listen, [])
# output :- [#PID<0.116.0>] is listening
#           PID<0.116.0>

# check process is running :- Process.alive?(pid)
# output :- true

# To run the tell function :- Person.tell(pid, "Hello Pavan")
# output :- [#PID<0.111.0>] Sending Hello Pavan to #PID<0.116.0>
#           [#PID<0.116.0>] Received Hello Pavan from #PID<0.111.0>
#           [#PID<0.116.0>] is listening
#           {:ok, #PID<0.111.0>, "Hello Pavan"}



defmodule Person do
  def tell(receiver, message) do
    IO.puts("[#{inspect(self())}] Sending #{message} to #{inspect(receiver)}")
    send(receiver, {:ok, self(), message})
  end

  def listen do
    IO.puts("[#{inspect(self())}] is listening")

    receive do
      {:ok, sender, message} ->
        IO.puts("[#{inspect(self())}] Received #{message} from #{inspect(sender)}")
    end

    # tail-call long running
    listen()
  end
end
