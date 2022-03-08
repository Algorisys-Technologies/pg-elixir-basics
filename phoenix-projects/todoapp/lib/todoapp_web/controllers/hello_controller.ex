defmodule TodoappWeb.HelloController do
  use TodoappWeb, :controller

  def index(conn, _params) do
    # text(conn,"Hello Pavan")
    render(conn, "index.html", %{})
  end
end
