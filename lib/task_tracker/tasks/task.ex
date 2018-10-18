defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :time_minutes, :integer
    field :time_hours, :integer
    field :title, :string
    field :user_id, :integer

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :user_id, :time_minutes, :completed, :time_hours])
    |> validate_required([:title, :user_id, :completed])
  end
end
