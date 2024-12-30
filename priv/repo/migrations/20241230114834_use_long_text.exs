defmodule TravelJournal.Repo.Migrations.UseLongText do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      # remove desc column
      remove :desc

      # add desc column again but now as :text type
      add :desc, :text
    end
  end
end
