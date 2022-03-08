# function fact(n){
#    if(n == 0) return 1;
#    return n * fact(n-1);
# }

defmodule Calc do
  def fact(0), do: 1
  def fact(n), do: n * fact(n - 1)

  # miltiply
  def mult([]), do: 1

  def mult([head | tail]) do
    head * mult(tail)
  end
end

Calc.fact(0) |> IO.puts()
# Calc.fact(5) |> IO.puts()
# Calc.fact(100000) |> IO.puts()
# Calc.mult([]) |> IO.puts()
# Calc.mult([1, 2, 3, 4]) |> IO.puts()
