# For run the code :- iex 01-if-else.exs
# output:- "positive"
#          "negative"
#          "negative"


# only one branch
# only one if else branch is supported.
defmodule Demo do
  def run do
    val = 5
    # if val == 5, do: "positive", else: "negative"
    if val == 5 do
      "positive"
    else
      "negative"
    end
  end

  def run1 do
    if false, do: "positive", else: "negative"
  end

  def run2 do
    if nil, do: "positive", else: "negative"
  end
end

Demo.run() |> IO.inspect()
Demo.run1() |> IO.inspect()
Demo.run2() |> IO.inspect()
