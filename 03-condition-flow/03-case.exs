# OptionParser is used for :- pass argument with run command

# example :- iex 03-case.exs --debug=true
# output :- "debug!"

# example :- iex 03-case.exs --debug
# output :- "debug!"

# example :- iex 03-case.exs --debug=false
# output :- "no debug!!"

# example :- iex 03-case.exs
# output :- "debug option is not set!"

defmodule Demo do
  def run(argv) do
    parsed_args = OptionParser.parse(argv, switches: [debug: :boolean])

    case Keyword.fetch(elem(parsed_args, 0), :debug) do
      {:ok, true} -> "debug!"
      {:ok, false} -> "no debug!!"
      _ -> "debug option is not set!"
    end
  end
end

Demo.run(System.argv()) |> IO.inspect()
