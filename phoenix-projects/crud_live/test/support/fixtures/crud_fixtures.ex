defmodule CrudLive.CRUDFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CrudLive.CRUD` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name"
      })
      |> CrudLive.CRUD.create_user()

    user
  end
end
