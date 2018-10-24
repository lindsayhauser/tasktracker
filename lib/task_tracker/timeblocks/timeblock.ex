defmodule TaskTracker.Timeblocks.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset


  schema "timeblocks" do
    field :date_start, :date, null: false
    field :time_start, :time, null: false
    field :date_end, :date, null: true
    field :time_end, :time, null: true
    belongs_to :task, TaskTracker.Tasks.Task
    field :currently_ongoing, :boolean  # Does this block have a start time but no end time? (is it currently running)

    #field :task_id, references(:tasks, on_delete: :delete_all), null: false
    #field :time_end, :naive_datetime
    #field :time_start, :naive_datetime
    #field :current_block, :boolean  # Does this block have a start time but no end time? (is it currently running)

    timestamps()
  end

  @doc false
  def changeset(timeblock, attrs) do
    timeblock
    |> cast(attrs, [:date_start, :time_start, :date_end, :time_end, :task_id, :currently_ongoing])
    |> validate_required([:date_start, :time_start, :task_id, :currently_ongoing])
  end
end
