defmodule PasswordManager.Repo.Migrations.CreateAccounts do
  use Ecto.Migration

  def change do
    create table(:accounts) do
      add :website_id, references(:websites, on_delete: :delete_all), null: false
      add :email, :string
      add :password, :string

      timestamps(type: :utc_datetime)
    end
  end
end
