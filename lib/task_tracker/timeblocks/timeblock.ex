defmodule TaskTracker.Timeblocks.Timeblock do
  use Ecto.Schema
  import Ecto.Changeset


  schema "timeblocks" do
    field :time_end, :naive_datetime
    field :time_start, :naive_datetime
    #field :task_id, :id
    belongs_to :task, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(timeblock, attrs) do
    timeblock
    |> cast(attrs, [:time_start, :time_end])
    |> validate_required([:time_start, :time_end])
  end
end
