defmodule PasswordManager.Repo.Migrations.CreateWebsites do
  use Ecto.Migration

  def change do
    create table(:websites) do
      add :url, :string
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
