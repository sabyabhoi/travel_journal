defmodule TravelJournalWeb.EntryLive.Index do
  use TravelJournalWeb, :live_view

  alias TravelJournal.Journal
  alias TravelJournal.Journal.Entry

  @impl true
  def mount(_params, _session, socket) do
    {
      :ok,
      stream(socket, :entries, Journal.list_entries()),
      layout: {TravelJournalWeb.Layouts, :liveview}
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Entry")
    |> assign(:entry, Journal.get_entry!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Entry")
    |> assign(:entry, %Entry{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Entries")
    |> assign(:entry, nil)
  end

  @impl true
  def handle_info({TravelJournalWeb.EntryLive.FormComponent, {:saved, entry}}, socket) do
    {:noreply, stream_insert(socket, :entries, entry)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    entry = Journal.get_entry!(id)
    {:ok, _} = Journal.delete_entry(entry)

    {:noreply, stream_delete(socket, :entries, entry)}
  end
end
