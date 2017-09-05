defmodule ParticipathonPruebaWeb.UsersController do
  use ParticipathonPruebaWeb, :controller

  alias ParticipathonPrueba.PQRMovil
  alias ParticipathonPrueba.PQRMovil.Users

  action_fallback ParticipathonPruebaWeb.FallbackController

  def index(conn, _params) do
    usuarios = PQRMovil.list_usuarios()
    render(conn, "index.json", usuarios: usuarios)
  end

  def create(conn, %{"users" => users_params}) do
    with {:ok, %Users{} = users} <- PQRMovil.create_users(users_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", users_path(conn, :show, users))
      |> render("show.json", users: users)
    end
    with {:error, %Users{} = users} <- PQRMovil.create_users(users_params) do
      IO.inspect({:error, users: users})
    end
  end

  def show(conn, %{"id" => id}) do
    users = PQRMovil.get_users!(id)
    render(conn, "show.json", users: users)
  end

  def update(conn, %{"id" => id, "users" => users_params}) do
    users = PQRMovil.get_users!(id)

    with {:ok, %Users{} = users} <- PQRMovil.update_users(users, users_params) do
      render(conn, "show.json", users: users)
    end
  end

  def delete(conn, %{"id" => id}) do
    users = PQRMovil.get_users!(id)
    with {:ok, %Users{}} <- PQRMovil.delete_users(users) do
      send_resp(conn, :no_content, "")
    end
  end
end
