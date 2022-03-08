defmodule Todoapp.TodoApp.Todo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Todoapp.DataContext.Comment

  schema "todos" do
    field(:completed, :boolean, default: false)
    field(:priority, :string)
    field(:title, :string)
    has_many(:comments, Comment, foreign_key: :todo_id)
    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :completed, :priority])
    |> validate_required([:title, :completed, :priority])
    |> validate_length(:priority, min: 2)
    |> validate_length(:priority, max: 7)
  end
end
