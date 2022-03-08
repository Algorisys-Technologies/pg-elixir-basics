defmodule CrudLive.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CrudLive.Repo,
      # Start the Telemetry supervisor
      CrudLiveWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CrudLive.PubSub},
      # Start the Endpoint (http/https)
      CrudLiveWeb.Endpoint
      # Start a worker by calling: CrudLive.Worker.start_link(arg)
      # {CrudLive.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrudLive.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    CrudLiveWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
