defmodule TravelJournalWeb.PageLive do
  alias TravelJournal.Journal
  use TravelJournalWeb, :live_view

  def mount(_params, _session, socket) do
    {:ok, assign(socket, entries: Journal.list_entries())}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-4">
      <.live_component
        :for={entry <- @entries}
        entry={entry}
        module={TravelJournalWeb.EntryCard}
        id={entry.id}
      />
    </div>
    """
  end
end
