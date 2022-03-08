defmodule TestJsonWeb.PageController do
  use TestJsonWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
