defmodule CrudLive.Repo.Migrations.CreateCrudUsers do
  use Ecto.Migration

  def change do
    create table(:crud_users) do
      add :first_name, :string
      add :last_name, :string

      timestamps()
    end
  end
end
