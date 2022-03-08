defmodule Demo do
  def work do
    IO.puts("I am busy doing work...")

    # receive:waits for message to arrive
    # If not message, it waits indefinitely

    result =
      receive do
        {sender, {a, b}} -> send(sender, a * b)
        {sender, message} -> send(sender, "#{message} Received successfully")
      after
        5000 -> IO.puts("Enough! I am done")
      end

    IO.inspect("Result is: #{result}")
  end

  def run(message) do
    pid =
      spawn(fn ->
        work()
      end)

    # send message with self() PID of current process
    send(pid, {self(), message})

    # Read from the mail box (FIFO)
    receive do
      response ->
        :timer.sleep(5000)
        IO.puts("Response: #{response}")
    after
      1000 -> IO.puts("No response received")
    end

    IO.puts("Is this blocked?")
  end
end

# Demo.run("hello processes!!")
Demo.run({1, 2})
