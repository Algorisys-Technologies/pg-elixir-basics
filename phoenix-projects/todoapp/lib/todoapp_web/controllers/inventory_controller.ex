defmodule TodoappWeb.InventoryController do
  use TodoappWeb, :controller

  alias Todoapp.InventoryApp
  alias Todoapp.InventoryApp.Inventory

  def index(conn, _params) do
    inventorys = InventoryApp.list_inventorys()
    render(conn, "index.html", inventorys: inventorys)
  end

  def new(conn, _params) do
    changeset = InventoryApp.change_inventory(%Inventory{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"inventory" => inventory_params}) do
    case InventoryApp.create_inventory(inventory_params) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory created successfully.")
        |> redirect(to: Routes.inventory_path(conn, :show, inventory))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    inventory = InventoryApp.get_inventory!(id)
    render(conn, "show.html", inventory: inventory)
  end

  def edit(conn, %{"id" => id}) do
    inventory = InventoryApp.get_inventory!(id)
    changeset = InventoryApp.change_inventory(inventory)
    render(conn, "edit.html", inventory: inventory, changeset: changeset)
  end

  def update(conn, %{"id" => id, "inventory" => inventory_params}) do
    inventory = InventoryApp.get_inventory!(id)

    case InventoryApp.update_inventory(inventory, inventory_params) do
      {:ok, inventory} ->
        conn
        |> put_flash(:info, "Inventory updated successfully.")
        |> redirect(to: Routes.inventory_path(conn, :show, inventory))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", inventory: inventory, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    inventory = InventoryApp.get_inventory!(id)
    {:ok, _inventory} = InventoryApp.delete_inventory(inventory)

    conn
    |> put_flash(:info, "Inventory deleted successfully.")
    |> redirect(to: Routes.inventory_path(conn, :index))
  end
end
