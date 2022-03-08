# shorten – takes a link, shortens it and returns the short link as a response
# get – take a short link and return the original one
# flush – erase the URL shortener memory
# stop – stop the process

# For start the server :- shortener = URLShortener.start
# output :- #PID<0.137.0>

# For check process is running :- Process.alive?(shortener)
# output :- true

# For Run the shorten function :- send shortener, {:shorten, "https://google.com", self()}
# output :- {:shorten, "https://google.com", #PID<0.106.0>}

# For shortener link remove from map :- flush
# output :- "99999ebcfdb78df077ad2727fd00969f"
#           :ok

# For Run the get function :- send shortener, {:get, "99999ebcfdb78df077ad2727fd00969f", self()}
# output :- {:get, "99999ebcfdb78df077ad2727fd00969f", #PID<0.102.0>}

# get the name of url :- flush
# output :- "https://google.com"
#            :ok

# For stop the process :- send shortener, {:stop, self()}
# output :- {:stop, #PID<0.106.0>}

# For check process is running :- Process.alive?(shortener)
# output :- false

defmodule URLShortener do
  def start do
    spawn(__MODULE__, :loop, [%{}])
  end

  def loop(state) do
    receive do
      {:stop, caller} ->
        send(caller, "Shutting down.")

      {:shorten, url, caller} ->
        url_md5 = md5(url)
        new_state = Map.put(state, url_md5, url)
        send(caller, url_md5)
        loop(new_state)

      {:get, md5, caller} ->
        send(caller, Map.fetch(state, md5))
        loop(state)

      :flush ->
        loop(%{})

      _ ->
        loop(state)
    end
  end

  defp md5(url) do
    :crypto.hash(:md5, url)
    |> Base.encode16(case: :lower)
  end
end
