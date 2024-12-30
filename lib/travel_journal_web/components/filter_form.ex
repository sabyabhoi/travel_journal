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
      <input id={@country} type="radio" value={@country} name="bordered-radio" class="w-4 h-4" />
      <label for={@country} class="w-full">
        {@country}
      </label>
    </div>
    """
  end
end
