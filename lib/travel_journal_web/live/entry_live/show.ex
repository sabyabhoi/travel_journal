defmodule TravelJournalWeb.EntryLive.Show do
  use TravelJournalWeb, :live_view

  alias TravelJournal.Journal

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket, layout: {TravelJournalWeb.Layouts, :liveview}}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:entry, Journal.get_entry!(id))}
  end

  defp page_title(:show), do: "Show Entry"
  defp page_title(:edit), do: "Edit Entry"
end
