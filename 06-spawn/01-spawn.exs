defmodule Demo do
  def work do
    IO.puts("Work process...")
    # exit(:normal)
    # simulating error below but no error occure because parent function run()
    # dont know about child function work() beacause their is no link between functions
    exit(:error)
  end

  def run do
    spawn(fn -> work() end)
    IO.puts("Doing something else...")
  end
end

Demo.run()
