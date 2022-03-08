defmodule CrudLiveWeb.UserLive.Index do
  use CrudLiveWeb, :live_view

  alias CrudLive.CRUD
  alias CrudLive.CRUD.User

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :crud_users, list_crud_users())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit User")
    |> assign(:user, CRUD.get_user!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New User")
    |> assign(:user, %User{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Crud users")
    |> assign(:user, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    user = CRUD.get_user!(id)
    {:ok, _} = CRUD.delete_user(user)

    {:noreply, assign(socket, :crud_users, list_crud_users())}
  end

  defp list_crud_users do
    CRUD.list_crud_users()
  end
end
