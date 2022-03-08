defmodule Todoapp.DataContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todoapp.DataContext` context.
  """

  @doc """
  Generate a comment.
  """
  def comment_fixture(attrs \\ %{}) do
    {:ok, comment} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Todoapp.DataContext.create_comment()

    comment
  end
end
