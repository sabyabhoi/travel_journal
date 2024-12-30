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
    |> validate_dates()
  end

  defp validate_dates(changeset) do
    case {get_field(changeset, :start_date), get_field(changeset, :end_date)} do
      {start_date, end_date} when not is_nil(start_date) and not is_nil(end_date) ->
        if Date.compare(start_date, end_date) in [:lt, :eq] do
          changeset
        else
          add_error(changeset, :start_date, "must be before or equal to end date")
        end

      _ ->
        changeset
    end
  end
end
