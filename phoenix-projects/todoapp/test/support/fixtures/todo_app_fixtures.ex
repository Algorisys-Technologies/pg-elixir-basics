defmodule Todoapp.TodoAppFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todoapp.TodoApp` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        completed: true,
        priority: "some priority",
        title: "some title"
      })
      |> Todoapp.TodoApp.create_todo()

    todo
  end
end
