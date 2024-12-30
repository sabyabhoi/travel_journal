defmodule TravelJournal.Journal.Entry do
  use Ecto.Schema
  import Ecto.Changeset

  schema "entries" do
    field :name, :string
    field :location, :string
    field :desc, :string
    field :start_date, :date
    field :end_date, :date
    field :country, :string
    field :image, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(entry, attrs) do
    entry
    |> cast(attrs, [:name, :start_date, :end_date, :desc, :country, :location, :image])
    |> validate_required([:name, :start_date, :end_date, :desc, :country, :location, :image])
  end
end
