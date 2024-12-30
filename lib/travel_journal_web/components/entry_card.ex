defmodule TravelJournalWeb.EntryCard do
  use Phoenix.LiveComponent

  def render(assigns) do
    format_date = fn date ->
      date
      |> Date.to_string()
      |> Date.from_iso8601!()
      |> Calendar.strftime("%d %b, %Y")
    end

    ~H"""
    <div class="flex flex-row border gap-4 p-4 rounded-lg">
      <img
        src="https://images.pexels.com/photos/994605/pexels-photo-994605.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
        class="max-w-xs h-auto object-cover"
        alt=""
      />
      <div class="flex flex-col gap-4">
        <div class="flex flex-row gap-4">
          <div>{@entry.country}</div>
          <a href={@entry.location}>View on Google Maps</a>
        </div>
        <h1 class="font-bold text-3xl">{@entry.name}</h1>
        <h3 class="font-bold">
          {format_date.(@entry.start_date)} - {format_date.(@entry.end_date)}
        </h3>
        <p>{@entry.desc}</p>
      </div>
    </div>
    """
  end
end
