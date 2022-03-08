defmodule Todoapp.InventoryAppTest do
  use Todoapp.DataCase

  alias Todoapp.InventoryApp

  describe "inventorys" do
    alias Todoapp.InventoryApp.Inventory

    import Todoapp.InventoryAppFixtures

    @invalid_attrs %{game: nil, name: nil, prize: nil}

    test "list_inventorys/0 returns all inventorys" do
      inventory = inventory_fixture()
      assert InventoryApp.list_inventorys() == [inventory]
    end

    test "get_inventory!/1 returns the inventory with given id" do
      inventory = inventory_fixture()
      assert InventoryApp.get_inventory!(inventory.id) == inventory
    end

    test "create_inventory/1 with valid data creates a inventory" do
      valid_attrs = %{game: "some game", name: "some name", prize: 42}

      assert {:ok, %Inventory{} = inventory} = InventoryApp.create_inventory(valid_attrs)
      assert inventory.game == "some game"
      assert inventory.name == "some name"
      assert inventory.prize == 42
    end

    test "create_inventory/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = InventoryApp.create_inventory(@invalid_attrs)
    end

    test "update_inventory/2 with valid data updates the inventory" do
      inventory = inventory_fixture()
      update_attrs = %{game: "some updated game", name: "some updated name", prize: 43}

      assert {:ok, %Inventory{} = inventory} = InventoryApp.update_inventory(inventory, update_attrs)
      assert inventory.game == "some updated game"
      assert inventory.name == "some updated name"
      assert inventory.prize == 43
    end

    test "update_inventory/2 with invalid data returns error changeset" do
      inventory = inventory_fixture()
      assert {:error, %Ecto.Changeset{}} = InventoryApp.update_inventory(inventory, @invalid_attrs)
      assert inventory == InventoryApp.get_inventory!(inventory.id)
    end

    test "delete_inventory/1 deletes the inventory" do
      inventory = inventory_fixture()
      assert {:ok, %Inventory{}} = InventoryApp.delete_inventory(inventory)
      assert_raise Ecto.NoResultsError, fn -> InventoryApp.get_inventory!(inventory.id) end
    end

    test "change_inventory/1 returns a inventory changeset" do
      inventory = inventory_fixture()
      assert %Ecto.Changeset{} = InventoryApp.change_inventory(inventory)
    end
  end
end
