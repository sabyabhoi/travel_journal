defmodule TravelJournalWeb.PageLive do
  alias TravelJournalWeb.FilterForm
  alias TravelJournal.Journal
  use TravelJournalWeb, :live_view

  def mount(_params, _session, socket) do
    entries = Journal.list_entries()

    countries =
      entries
      |> Enum.map(fn entry -> entry.country end)
      |> Enum.uniq()

    {
      :ok,
      socket
      |> assign(entries: entries)
      |> assign(countries: countries)
    }
  end

  def render(assigns) do
    ~H"""
    <div class="grid grid-cols-5 m-4 gap-4">
      <.live_component module={FilterForm} id="filter-form" countries={@countries} />
      <div class="col-span-3 grid grid-cols-1 gap-4">
        <.live_component
          :for={entry <- @entries}
          entry={entry}
          module={TravelJournalWeb.EntryCard}
          id={entry.id}
        />
      </div>
      <div />
    </div>
    """
  end
end
