defmodule TaskTrackerWeb.TimeblockController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Timeblocks
  alias TaskTracker.Timeblocks.Timeblock

  action_fallback TaskTrackerWeb.FallbackController

  def index(conn, _params) do
    timeblocks = Timeblocks.list_timeblocks()
    render(conn, "index.json", timeblocks: timeblocks)
  end

  def create(conn, %{"timeblock" => timeblock_params}) do
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
    timeblock = Timeblocks.get_timeblock!(id)
    render(conn, "show.json", timeblock: timeblock)
  end

  def update(conn, %{"id" => id, "timeblock" => timeblock_params}) do
    button = Map.get(timeblock_params, "manual", false)

    if button do
      IO.puts("We got to th emanual part")
      timeblock = Timeblocks.get_timeblock!(Map.get(timeblock_params, "timeblock_id", 1))
      start_year = Map.get(timeblock_params, "start_date_year", 2018)
      start_month = Map.get(timeblock_params, "start_date_month", 12)
      start_day = Map.get(timeblock_params, "start_date_day", 12)

      start_hour = Map.get(timeblock_params, "start_time_hour", 12)
      start_minute = Map.get(timeblock_params, "start_time_minute", 00)
      start_second = Map.get(timeblock_params, "start_time_second", 00)

      end_year = Map.get(timeblock_params, "end_date_year", 2018)
      end_month = Map.get(timeblock_params, "end_date_month", 12)
      end_day = Map.get(timeblock_params, "end_date_day", 12)

      end_hour = Map.get(timeblock_params, "end_time_hour", 12)
      end_minute = Map.get(timeblock_params, "end_time_minute", 00)
      end_second = Map.get(timeblock_params, "end_time_second", 00)

      date_start = %Date{year: start_year, month: start_month, day: start_day}
      date_end = %Date{year: end_year, month: end_month, day: end_day}

      time_start = %Time{hour: start_hour, minute: start_minute, second: start_second}
      time_end = %Time{hour: end_hour, minute: end_minute, second: end_second}

      timeblock_params= Map.put(timeblock_params, "date_end", date_end);
      timeblock_params= Map.put(timeblock_params, "time_end", time_end);
      timeblock_params= Map.put(timeblock_params, "date_start", date_start);
      timeblock_params= Map.put(timeblock_params, "time_start", time_start);

      with {:ok, %Timeblock{} = timeblock} <- Timeblocks.update_timeblock(timeblock, timeblock_params) do
        render(conn, "show.json", timeblock: timeblock)
      end

    else
    timeblock = Timeblocks.getCurrentBlock(id)
    timeblock_params= Map.put(timeblock_params, "date_end", DateTime.to_date(DateTime.utc_now));
    timeblock_params= Map.put(timeblock_params, "time_end", DateTime.to_time(DateTime.utc_now));
    timeblock_params= Map.put(timeblock_params, "currently_ongoing", false);

    with {:ok, %Timeblock{} = timeblock} <- Timeblocks.update_timeblock(timeblock, timeblock_params) do
      render(conn, "show.json", timeblock: timeblock)
    end
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
    timeblock = Timeblocks.get_timeblock!(id)
    render(conn, "show.json", timeblock: timeblock)
  end
end
