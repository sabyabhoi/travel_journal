defmodule TravelJournalWeb.FilterForm do
  use Phoenix.LiveComponent

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col p-4 gap-2">
      <div class="flex flex-row items-center gap-2 p-4 border rounded-lg">
        <input type="radio" value="all" name="country-filter" />
        <label for="foo">All Countries</label>
      </div>
      <div :for={country <- @countries} class="flex flex-row items-center gap-2 p-4 border rounded-lg">
        <input type="radio" value={country} name="country-filter" />
        <label for={country}>{country}</label>
      </div>
    </div>
    """
  end
end
