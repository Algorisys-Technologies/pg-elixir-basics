defmodule CrudLive.CRUDTest do
  use CrudLive.DataCase

  alias CrudLive.CRUD

  describe "crud_users" do
    alias CrudLive.CRUD.User

    import CrudLive.CRUDFixtures

    @invalid_attrs %{first_name: nil, last_name: nil}

    test "list_crud_users/0 returns all crud_users" do
      user = user_fixture()
      assert CRUD.list_crud_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert CRUD.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name"}

      assert {:ok, %User{} = user} = CRUD.create_user(valid_attrs)
      assert user.first_name == "some first_name"
      assert user.last_name == "some last_name"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CRUD.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name"}

      assert {:ok, %User{} = user} = CRUD.update_user(user, update_attrs)
      assert user.first_name == "some updated first_name"
      assert user.last_name == "some updated last_name"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = CRUD.update_user(user, @invalid_attrs)
      assert user == CRUD.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = CRUD.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> CRUD.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = CRUD.change_user(user)
    end
  end
end
