defmodule ParticipathonPrueba.Repo.Migrations.CreateUsuarios do
  use Ecto.Migration

  def change do
    create table(:usuarios) do
      add :nit, :integer
      add :tipo_nit, :string
      add :nombre, :string
      add :email, :string
      add :telefono, :integer
      add :direccion, :string
      add :departamento, :string
      add :ciudad, :string
      add :"contraseña", :string

      timestamps()
    end

  end
end
