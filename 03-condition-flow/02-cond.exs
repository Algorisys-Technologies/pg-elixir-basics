# For run the code :- iex 02-cond.exs
# output:- "An Empty String..."
#          "short"
#          "medium"
#          "long"


# pattern matching (multiple branches)
defmodule Demo do
  def run(str) do
    len = String.length(str)

    cond do
      len > 0 && len < 5 -> "short"
      len >= 5 && len < 10 -> "medium"
      len >= 10 -> "long"
      # fallback clause
      true -> "An Empty String..."
    end
  end
end

Demo.run("") |> IO.inspect()
Demo.run("H") |> IO.inspect()
Demo.run("Hello") |> IO.inspect()
Demo.run("Hello elixir!") |> IO.inspect()
