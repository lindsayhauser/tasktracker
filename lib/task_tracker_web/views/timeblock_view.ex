defmodule TaskTrackerWeb.TimeblockView do
  use TaskTrackerWeb, :view
  alias TaskTrackerWeb.TimeblockView

  def render("index.json", %{timeblocks: timeblocks}) do
    %{data: render_many(timeblocks, TimeblockView, "timeblock.json")}
  end

  def render("show.json", %{timeblock: timeblock}) do
    %{data: render_one(timeblock, TimeblockView, "timeblock.json")}
  end

  def render("timeblock.json", %{timeblock: timeblock}) do
    %{id: timeblock.id,
      time_start: timeblock.time_start,
      time_end: timeblock.time_end}
  end
end
