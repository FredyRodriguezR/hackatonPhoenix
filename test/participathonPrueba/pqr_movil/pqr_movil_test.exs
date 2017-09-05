defmodule ParticipathonPrueba.PQRMovilTest do
  use ParticipathonPrueba.DataCase

  alias ParticipathonPrueba.PQRMovil

  describe "usuarios" do
    alias ParticipathonPrueba.PQRMovil.Users

    @valid_attrs %{ciudad: "some ciudad", "contraseña": "some contraseña", departamento: "some departamento", direccion: "some direccion", email: "some email", nit: 42, nombre: "some nombre", telefono: 42, tipo_nit: "some tipo_nit"}
    @update_attrs %{ciudad: "some updated ciudad", "contraseña": "some updated contraseña", departamento: "some updated departamento", direccion: "some updated direccion", email: "some updated email", nit: 43, nombre: "some updated nombre", telefono: 43, tipo_nit: "some updated tipo_nit"}
    @invalid_attrs %{ciudad: nil, "contraseña": nil, departamento: nil, direccion: nil, email: nil, nit: nil, nombre: nil, telefono: nil, tipo_nit: nil}

    def users_fixture(attrs \\ %{}) do
      {:ok, users} =
        attrs
        |> Enum.into(@valid_attrs)
        |> PQRMovil.create_users()

      users
    end

    test "list_usuarios/0 returns all usuarios" do
      users = users_fixture()
      assert PQRMovil.list_usuarios() == [users]
    end

    test "get_users!/1 returns the users with given id" do
      users = users_fixture()
      assert PQRMovil.get_users!(users.id) == users
    end

    test "create_users/1 with valid data creates a users" do
      assert {:ok, %Users{} = users} = PQRMovil.create_users(@valid_attrs)
      assert users.ciudad == "some ciudad"
      assert users.contraseña == "some contraseña"
      assert users.departamento == "some departamento"
      assert users.direccion == "some direccion"
      assert users.email == "some email"
      assert users.nit == 42
      assert users.nombre == "some nombre"
      assert users.telefono == 42
      assert users.tipo_nit == "some tipo_nit"
    end

    test "create_users/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = PQRMovil.create_users(@invalid_attrs)
    end

    test "update_users/2 with valid data updates the users" do
      users = users_fixture()
      assert {:ok, users} = PQRMovil.update_users(users, @update_attrs)
      assert %Users{} = users
      assert users.ciudad == "some updated ciudad"
      assert users.contraseña == "some updated contraseña"
      assert users.departamento == "some updated departamento"
      assert users.direccion == "some updated direccion"
      assert users.email == "some updated email"
      assert users.nit == 43
      assert users.nombre == "some updated nombre"
      assert users.telefono == 43
      assert users.tipo_nit == "some updated tipo_nit"
    end

    test "update_users/2 with invalid data returns error changeset" do
      users = users_fixture()
      assert {:error, %Ecto.Changeset{}} = PQRMovil.update_users(users, @invalid_attrs)
      assert users == PQRMovil.get_users!(users.id)
    end

    test "delete_users/1 deletes the users" do
      users = users_fixture()
      assert {:ok, %Users{}} = PQRMovil.delete_users(users)
      assert_raise Ecto.NoResultsError, fn -> PQRMovil.get_users!(users.id) end
    end

    test "change_users/1 returns a users changeset" do
      users = users_fixture()
      assert %Ecto.Changeset{} = PQRMovil.change_users(users)
    end
  end
end
