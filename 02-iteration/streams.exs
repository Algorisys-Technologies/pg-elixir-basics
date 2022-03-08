# defmodule Streams do
#   def transform do
#     [1, 2, 3, 4, 5, 6]
#     |> Enum.map(fn n -> n * 2 end)
#     |> Enum.drop_every(3)
#     |> Enum.reduce(0, fn c, p -> c + p end)
#   end
# end

# macro notion here &1 means first parameter
# defmodule Streams do
#   def transform do
#     [1, 2, 3, 4, 5, 6]
#     |> Enum.map(&(&1 * 2))
#     |> Enum.drop_every(3)
#     |> Enum.reduce(0, &(&1 + &2))
#   end
# end

defmodule Streams do
  def transform do
    [1, 2, 3, 4, 5, 6]
    |> Stream.map(&(&1 * 2))
    |> Stream.drop_every(3)
    |> Enum.reduce(0, &(&1 + &2))
  end
end

Streams.transform() |> IO.inspect()
