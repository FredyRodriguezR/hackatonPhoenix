defmodule ParticipathonPrueba.PQRMovil.Users do
  use Ecto.Schema
  import Ecto.Changeset
  alias ParticipathonPrueba.PQRMovil.Users


  schema "usuarios" do
    field :ciudad, :string
    field :"contrasena", :string
    field :departamento, :string
    field :direccion, :string
    field :email, :string
    field :nit, :integer
    field :nombre, :string
    field :telefono, :integer
    field :tipo_nit, :string

    timestamps()
  end

  @doc false
  def changeset(%Users{} = users, attrs) do
    users
    |> cast(attrs, [:nit, :tipo_nit, :nombre, :email, :telefono, :direccion, :departamento, :ciudad, :"contrasena"])
    |> validate_required([:nit, :tipo_nit, :nombre, :email, :telefono, :direccion, :departamento, :ciudad, :"contrasena"])
    |> validate_format(:email, ~r/@/)
  end
end
