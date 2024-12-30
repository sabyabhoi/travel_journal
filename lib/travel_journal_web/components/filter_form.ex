defmodule TravelJournalWeb.FilterForm do
  use Phoenix.LiveComponent

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    ~H"""
    <div class="flex flex-col gap-2">
      <.radio_button country="All Countries" />
      <.radio_button :for={country <- @countries} country={country} />
    </div>
    """
  end

  attr :country, :string, required: true

  def radio_button(assigns) do
    ~H"""
    <div class="flex flex-row items-center gap-2 p-4 border rounded-lg">
      <input type="radio" value={@country} name="country-filter" />
      <label for={@country}>{@country}</label>
    </div>
    """
  end
end
