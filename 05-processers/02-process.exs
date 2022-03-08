# FOr run the code:- iex 02-process.exs
# output :- #PID<0.110.0>
#           #PID<0.111.0>
#           #PID<0.112.0>
#           #PID<0.113.0>
#           #PID<0.114.0>
#           Interactive Elixir (1.12.3) - press Ctrl+C to exit (type h() ENTER for help)
#           5: Result is -2.588343154576935
#           2: Result is -7.5971424452323415
#           3: Result is 5.961563129814945
#           1: Result is -5.678020388403603
#           4: Result is -2.476212580545928

defmodule Demo do
  def work(number, index) do
    pid =
      spawn(fn ->
        :timer.sleep(5000)
        IO.puts("#{index}: Result is #{:rand.normal() * number}")
      end)

    pid |> IO.inspect()
  end

  def run(number) do
    Enum.each(1..5, &work(number, &1))
  end
end

Demo.run(5)
