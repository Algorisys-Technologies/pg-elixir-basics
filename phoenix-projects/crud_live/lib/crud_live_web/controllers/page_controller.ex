defmodule CrudLiveWeb.PageController do
  use CrudLiveWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
