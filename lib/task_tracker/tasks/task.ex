defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :time_minutes, :integer
    field :time_hours, :integer
    field :title, :string
    field :user, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :user, :time_minutes, :completed, :time_hours])
    |> validate_required([:title, :user, :completed])
  end
end
