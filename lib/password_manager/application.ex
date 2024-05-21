defmodule PasswordManager.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      PasswordManagerWeb.Telemetry,
      PasswordManager.Repo,
      {DNSCluster, query: Application.get_env(:password_manager, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: PasswordManager.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: PasswordManager.Finch},
      # Start a worker by calling: PasswordManager.Worker.start_link(arg)
      # {PasswordManager.Worker, arg},
      # Start to serve requests, typically the last entry
      PasswordManagerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: PasswordManager.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    PasswordManagerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
