defmodule PasswordManager.Repo do
  use Ecto.Repo,
    otp_app: :password_manager,
    adapter: Ecto.Adapters.Postgres
end
