defmodule PasswordManager.Website do
  use Ecto.Schema
  import Ecto.Changeset

  schema "websites" do
    field :name, :string
    field :url, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(website, attrs) do
    website
    |> cast(attrs, [:url, :name])
    |> validate_required([:url, :name])
  end
end
