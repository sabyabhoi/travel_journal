defmodule TravelJournal.Repo do
  use Ecto.Repo,
    otp_app: :travel_journal,
    adapter: Ecto.Adapters.Postgres
end
