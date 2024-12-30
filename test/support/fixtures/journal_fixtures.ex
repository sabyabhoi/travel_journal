defmodule TravelJournal.JournalFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TravelJournal.Journal` context.
  """

  @doc """
  Generate a entry.
  """
  def entry_fixture(attrs \\ %{}) do
    {:ok, entry} =
      attrs
      |> Enum.into(%{
        country: "some country",
        desc: "some desc",
        end_date: ~D[2024-12-29],
        location: "some location",
        name: "some name",
        start_date: ~D[2024-12-29]
      })
      |> TravelJournal.Journal.create_entry()

    entry
  end
end
