defmodule PasswordManagerWeb.WelcomeController do
  use PasswordManagerWeb, :controller

  def welcome(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :welcome, layout: false)
  end
end
