defmodule TaskTrackerWeb.TimeblockController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Timeblocks
  alias TaskTracker.Timeblocks.Timeblock
  alias TaskTracker.Tasks

  action_fallback TaskTrackerWeb.FallbackController

  def index(conn, _params) do
    IO.puts("Got to EDIT")
    timeblocks = Timeblocks.list_timeblocks()
    render(conn, "index.json", timeblocks: timeblocks)
  end

  def create(conn, %{"timeblock" => timeblock_params}) do
    IO.puts("Got to CREATE")
    timeblock_params= Map.put(timeblock_params, "date_start", DateTime.to_date(DateTime.utc_now));
    timeblock_params= Map.put(timeblock_params, "time_start", DateTime.to_time(DateTime.utc_now));
    timeblock_params= Map.put(timeblock_params, "currently_ongoing", true);
    timeblock_params= Map.put(timeblock_params, "date_end", nil);
    timeblock_params= Map.put(timeblock_params, "time_end",  nil);

    with {:ok, %Timeblock{} = timeblock} <- Timeblocks.create_timeblock(timeblock_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.timeblock_path(conn, :show, timeblock))
      |> render("show.json", timeblock: timeblock)
    end
  end

  def edit(conn, %{"id" => id}) do
    IO.puts("Got to EDIT")
    timeblock = Timeblocks.get_timeblock!(id)
    render(conn, "show.json", timeblock: timeblock)
  end

  def update(conn, %{"id" => id, "timeblock" => timeblock_params}) do
    IO.puts("Got to the udpate here")

    timeblock = Timeblocks.getCurrentBlock(id)
    timeblock_params= Map.put(timeblock_params, "date_end", DateTime.to_date(DateTime.utc_now));
    timeblock_params= Map.put(timeblock_params, "time_end", DateTime.to_time(DateTime.utc_now));
    timeblock_params= Map.put(timeblock_params, "currently_ongoing", false);

    with {:ok, %Timeblock{} = timeblock} <- Timeblocks.update_timeblock(timeblock, timeblock_params) do
      render(conn, "show.json", timeblock: timeblock)
    end
  end

  def delete(conn, %{"id" => id}) do
    IO.puts("got to the delete here")
    timeblock = Timeblocks.get_timeblock!(id)

    with {:ok, %Timeblock{}} <- Timeblocks.delete_timeblock(timeblock) do
      send_resp(conn, :no_content, "")
    end
  end

  def show(conn, %{"id" => id}) do
    IO.puts("Got to the show")
    timeblock = Timeblocks.get_timeblock!(id)
    render(conn, "show.json", timeblock: timeblock)
  end
end
