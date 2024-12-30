defmodule TravelJournalWeb.PageLive do
  alias TravelJournal.Journal
  use TravelJournalWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, entries: Journal.list_entries())}
  end

  def render(assigns) do
    IO.puts("ASSIGNS:")
    IO.inspect(assigns)

    ~H"""
    <%= for entry <- @entries do %>
      <.live_component entry={entry} module={TravelJournalWeb.EntryCard} id={entry.id} />
    <% end %>
    """
  end
end
