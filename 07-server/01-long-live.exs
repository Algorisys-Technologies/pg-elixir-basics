# For run :- iex 01-long-live.exs
# For spawn the process :- pid = spawn(Livelong, :run, [])
# output:- #PID<0.114.0>

# For check process is running :- Process.alive?(pid)
# output :- true

# To get the information of process :- Process.info(pid)
# output:- information about process.

# Simplest long running process (This function never crase)
defmodule Livelong do
  def run do
    run()
  end
end
