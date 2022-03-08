# iex 03-spawn_monitor.exs
# spawn the process :- spawn(Demo, :work, [])
# output:- doing work...
#          #PID<0.116.0>

# run the method :- Demo.run()
# output:- doing work...
# {:DOWN, #Reference<0.2321956287.173801474.6730>, :process, #PID<0.118.0>,
# :error}
# {:DOWN, #Reference<0.2321956287.173801474.6730>, :process, #PID<0.118.0>,
# :error}

#Uni directional
defmodule Demo do
  def work do
    IO.puts("doing work...")
    exit(:error)
  end

  def run do
    # Process.monitor(pid)
    spawn_monitor(Demo, :work, [])

    receive do
      msg -> IO.inspect(msg)
    end
  end
end

Demo.run()
