defmodule ParticipathonPruebaWeb.UsersView do
  use ParticipathonPruebaWeb, :view
  alias ParticipathonPruebaWeb.UsersView

  def render("index.json", %{usuarios: usuarios}) do
    %{data: render_many(usuarios, UsersView, "users.json")}
  end

  def render("show.json", %{users: users}) do
    %{data: render_one(users, UsersView, "users.json")}
  end

  def render("users.json", %{users: users}) do
    %{id: users.id,
      nit: users.nit,
      tipo_nit: users.tipo_nit,
      nombre: users.nombre,
      email: users.email,
      telefono: users.telefono,
      direccion: users.direccion,
      departamento: users.departamento,
      ciudad: users.ciudad,
      contrasena: users.contrasena}
  end
end
