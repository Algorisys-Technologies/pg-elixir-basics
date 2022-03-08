defmodule Todoapp.InventoryAppFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todoapp.InventoryApp` context.
  """

  @doc """
  Generate a inventory.
  """
  def inventory_fixture(attrs \\ %{}) do
    {:ok, inventory} =
      attrs
      |> Enum.into(%{
        game: "some game",
        name: "some name",
        prize: 42
      })
      |> Todoapp.InventoryApp.create_inventory()

    inventory
  end
end
