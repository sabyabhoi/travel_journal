defmodule TravelJournalWeb.EntryCard do
  alias TravelJournalWeb.CoreComponents
  use Phoenix.LiveComponent

  import CoreComponents

  def render(assigns) do
    format_date = fn date ->
      date
      |> Date.to_string()
      |> Date.from_iso8601!()
      |> Calendar.strftime("%d %b, %Y")
    end

    assigns =
      assigns
      |> assign(:start_date, format_date.(assigns.entry.start_date))
      |> assign(:end_date, format_date.(assigns.entry.end_date))

    ~H"""
    <div class="flex flex-row border gap-6 p-6 rounded-lg bg-white drop-shadow-sm">
      <img
        src={@entry.image}
        class="max-w-xs h-auto object-cover rounded-lg"
        alt={"Image of " <> @entry.name}
      />
      <div class="flex flex-col gap-6">
        <div class="flex flex-row gap-6 items-center">
          <div class="uppercase tracking-widest flex flex-row gap-2 items-center">
            <.icon name="hero-map-pin-solid" class="h-6 w-6 bg-red-500" />
            {@entry.country}
          </div>
          <a href={@entry.location} class="text-zinc-400 underline tracking-wider hover:text-zinc-600">
            View on Google Maps
          </a>
        </div>
        <h1 class="font-bold text-3xl">{@entry.name}</h1>
        <h3 class="font-bold">
          {@start_date} - {@end_date}
        </h3>
        <p class="text-zinc-600">{@entry.desc}</p>
      </div>
    </div>
    """
  end
end
