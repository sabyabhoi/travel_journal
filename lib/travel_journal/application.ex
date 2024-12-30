defmodule TravelJournal.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TravelJournalWeb.Telemetry,
      TravelJournal.Repo,
      {DNSCluster, query: Application.get_env(:travel_journal, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: TravelJournal.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: TravelJournal.Finch},
      # Start a worker by calling: TravelJournal.Worker.start_link(arg)
      # {TravelJournal.Worker, arg},
      # Start to serve requests, typically the last entry
      TravelJournalWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TravelJournal.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TravelJournalWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
