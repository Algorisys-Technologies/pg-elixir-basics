# For run the code :- iex 01-process.exs
# output:- #PID<0.110.0>
#          Doing some other stuff

defmodule Demo do
  def work() do
    # Long running method
    :timer.sleep(5000)
    IO.puts("I am done: #{:rand.normal()}")
  end

  def run do
    # spawn returns PID immediately
    spawn(fn -> work() end)
  end
end

# pid = Demo.run()

# Alternate way to spawn a process
pid = spawn(Demo, :run, [])
pid |> IO.inspect()
IO.puts("Doing some other stuff")
