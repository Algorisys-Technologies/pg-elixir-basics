# shorten – takes a link, shortens it and returns the short link as a response
# get – take a short link and return the original one
# flush – erase the URL shortener memory
# stop – stop the process

# For start the server :- {:ok, pid} = URLShortener.start_link
# output :- {:ok, #PID<0.118.0>}

# For check process is running :- Process.alive?(pid)
# output :- true

# For Run the shorten function :- URLShortener.shorten("https://google.com")
# output :- "99999ebcfdb78df077ad2727fd00969f"

# For Run the get function :- URLShortener.get("99999ebcfdb78df077ad2727fd00969f")
# output :- "https://google.com"

# For Count the number of url for shorten :- URLShortener.count
# output :- 1

# For erase the URL shortener memory :- URLShortener.flush
# output :- :ok

# For stop the process :- URLShortener.stop
# output :- :ok

# For check process is running :- Process.alive?(pid)
# output :- false

defmodule URLShortener do
  use GenServer

  @name :url_shortener_server

  # Client API
  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, :ok, opts ++ [name: @name])
  end

  def stop, do: GenServer.cast(@name, :stop)
  def shorten(url), do: GenServer.call(@name, {:shorten, url})

  def get(short_link) do
    GenServer.call(@name, {:get, short_link})
  end

  def flush do
    GenServer.cast(@name, :flush)
  end

  def count do
    GenServer.call(@name, :count)
  end

  # GenServer callbacks
  def init(:ok), do: {:ok, %{}}
  def handle_cast(:stop, state), do: {:stop, :normal, state}

  def handle_call({:shorten, url}, _from, state) do
    short = md5(url)
    {:reply, short, Map.put(state, short, url)}
  end

  def handle_call({:get, short_link}, _from, state) do
    {:reply, Map.get(state, short_link), state}
  end

  def handle_cast(:flush, _state) do
    {:noreply, %{}}
  end

  def handle_call(:count, _from, state) do
    count = Map.keys(state) |> Enum.count()
    {:reply, count, state}
  end

  defp md5(url) do
    :crypto.hash(:md5, url)
    |> Base.encode16(case: :lower)
  end
end
