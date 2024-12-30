defmodule TravelJournal.Repo.Migrations.CreateEntries do
  use Ecto.Migration

  def change do
    create table(:entries) do
      add :name, :string
      add :start_date, :date
      add :end_date, :date
      add :desc, :string
      add :country, :string
      add :location, :string

      timestamps(type: :utc_datetime)
    end
  end
end
