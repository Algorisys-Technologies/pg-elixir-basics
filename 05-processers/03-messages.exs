defmodule Demo do
  def work do
    IO.puts("I am busy doing work...")

    # receive:waits for message to arrive
    # If not message, it waits indefinitely

    result =
      receive do
        {a, b} -> a * b
        message -> message
      end

    IO.inspect(result)
  end

  def run(message) do
    pid =
      spawn(fn ->
        work()
      end)

    # send message
    send(pid, message)
  end
end

Demo.run("hello processes!!")
Demo.run({1, 2})
