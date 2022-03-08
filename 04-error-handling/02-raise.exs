# For run the code :- iex 02-raise.exs
# output:- ** (DemoException) New error message, override the default error message
#             02-raise.exs:18: DemoException.run/0
#             (elixir 1.12.3) lib/code.ex:1261: Code.require_file/2

defmodule Demo do
  def run do
    try do
      # raise "error!"
      raise ArgumentError, message: "Error: Invalid arguments"
    rescue
      e in ArgumentError -> IO.inspect(e)
    end
  end
end

defmodule DemoException do
  # set default error message
  defexception message: "Error occure in DemoException"

  def run do
    # raise DemoException
    raise DemoException, message: "New error message, override the default error message"
  end
end

# Demo.run()
DemoException.run()
