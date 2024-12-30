defmodule TravelJournal.JournalTest do
  use TravelJournal.DataCase

  alias TravelJournal.Journal

  describe "entries" do
    alias TravelJournal.Journal.Entry

    import TravelJournal.JournalFixtures

    @invalid_attrs %{name: nil, location: nil, desc: nil, start_date: nil, end_date: nil, country: nil}

    test "list_entries/0 returns all entries" do
      entry = entry_fixture()
      assert Journal.list_entries() == [entry]
    end

    test "get_entry!/1 returns the entry with given id" do
      entry = entry_fixture()
      assert Journal.get_entry!(entry.id) == entry
    end

    test "create_entry/1 with valid data creates a entry" do
      valid_attrs = %{name: "some name", location: "some location", desc: "some desc", start_date: ~D[2024-12-29], end_date: ~D[2024-12-29], country: "some country"}

      assert {:ok, %Entry{} = entry} = Journal.create_entry(valid_attrs)
      assert entry.name == "some name"
      assert entry.location == "some location"
      assert entry.desc == "some desc"
      assert entry.start_date == ~D[2024-12-29]
      assert entry.end_date == ~D[2024-12-29]
      assert entry.country == "some country"
    end

    test "create_entry/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Journal.create_entry(@invalid_attrs)
    end

    test "update_entry/2 with valid data updates the entry" do
      entry = entry_fixture()
      update_attrs = %{name: "some updated name", location: "some updated location", desc: "some updated desc", start_date: ~D[2024-12-30], end_date: ~D[2024-12-30], country: "some updated country"}

      assert {:ok, %Entry{} = entry} = Journal.update_entry(entry, update_attrs)
      assert entry.name == "some updated name"
      assert entry.location == "some updated location"
      assert entry.desc == "some updated desc"
      assert entry.start_date == ~D[2024-12-30]
      assert entry.end_date == ~D[2024-12-30]
      assert entry.country == "some updated country"
    end

    test "update_entry/2 with invalid data returns error changeset" do
      entry = entry_fixture()
      assert {:error, %Ecto.Changeset{}} = Journal.update_entry(entry, @invalid_attrs)
      assert entry == Journal.get_entry!(entry.id)
    end

    test "delete_entry/1 deletes the entry" do
      entry = entry_fixture()
      assert {:ok, %Entry{}} = Journal.delete_entry(entry)
      assert_raise Ecto.NoResultsError, fn -> Journal.get_entry!(entry.id) end
    end

    test "change_entry/1 returns a entry changeset" do
      entry = entry_fixture()
      assert %Ecto.Changeset{} = Journal.change_entry(entry)
    end
  end
end
