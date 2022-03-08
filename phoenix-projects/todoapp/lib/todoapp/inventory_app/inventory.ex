defmodule Todoapp.InventoryApp.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventorys" do
    field :game, :string
    field :name, :string
    field :prize, :integer

    timestamps()
  end

  @doc false
  def changeset(inventory, attrs) do
    inventory
    |> cast(attrs, [:name, :prize, :game])
    |> validate_required([:name, :prize, :game])
  end
end
