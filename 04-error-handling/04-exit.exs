# For run the code :- iex 04-exit.exs
# output:- "Exited as something is not good"

# Process can exit. (We can track them)
defmodule Demo do
  def run do
    try do
      # normal exit
      # exit(:normal)
      exit(:very_bad)
      # exit(:idk)
    catch
      :exit, :very_bad -> "Exited as something is not good"
      :exit, _ -> "Something very very bad happened"
    end
  end
end

Demo.run() |> IO.inspect()
