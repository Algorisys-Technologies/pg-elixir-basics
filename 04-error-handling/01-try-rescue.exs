# For run the code :- iex 01-try-rescue.exs
# output:- I will always run no matter what error occure or not!!
#          "Found 10"

defmodule Demo do
  def run do
    try do
      Keyword.fetch!([a: 10], :a)
    rescue
      # e in KeyError -> e
      KeyError -> IO.puts("key not found!")
      ArgumentError -> "...."
    after
      # finally, ensure
      IO.puts("I will always run no matter what error occure or not!!")
    else
      # Executed only if there are no errors and also
      # the value returned in try is available here

      10 -> "Found 10"
      _ -> "Not sure what's that"
    end
  end
end

Demo.run() |> IO.inspect()
