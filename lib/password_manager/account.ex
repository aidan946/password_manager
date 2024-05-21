defmodule PasswordManager.Account do
  use Ecto.Schema
  import Ecto.Changeset

  schema "accounts" do
    field :password, :string
    field :email, :string
    belongs_to :user, PasswordManager.Website

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(account, attrs) do
    account
    |> cast(attrs, [:email, :password])
    |> validate_required([:email, :password])
  end
end
