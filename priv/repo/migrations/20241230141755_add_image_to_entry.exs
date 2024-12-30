defmodule TravelJournal.Repo.Migrations.AddImageToEntry do
  use Ecto.Migration

  def change do
    alter table(:entries) do
      add :image, :string
    end
  end
end
