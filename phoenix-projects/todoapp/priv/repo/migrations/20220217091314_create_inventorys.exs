defmodule Todoapp.Repo.Migrations.CreateInventorys do
  use Ecto.Migration

  def change do
    create table(:inventorys) do
      add :name, :string
      add :prize, :integer
      add :game, :string

      timestamps()
    end
  end
end
