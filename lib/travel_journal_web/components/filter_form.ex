defmodule TravelJournalWeb.FilterForm do
  use Phoenix.LiveComponent

  import TravelJournalWeb.CoreComponents

  def mount(socket) do
    {:ok, socket}
  end

  def render(assigns) do
    assigns = assign(assigns, form: to_form(%{}))

    ~H"""
    <div>
      <.simple_form for={@form} class="flex flex-col gap-2" phx-change="filter">
        <.radio_button country="All Countries" checked={true} />
        <.radio_button :for={country <- @countries} country={country} />
      </.simple_form>
    </div>
    """
  end

  attr :country, :string, required: true
  attr :checked, :boolean, default: false

  def radio_button(assigns) do
    ~H"""
    <div class="flex flex-row items-center gap-2 p-4 border rounded-lg">
      <input
        id={@country}
        type="radio"
        value={@country}
        name="bordered-radio"
        class="w-4 h-4"
        checked={@checked}
      />
      <label for={@country} class="w-full">
        {@country}
      </label>
    </div>
    """
  end
end
