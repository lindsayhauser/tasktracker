defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset


  schema "tasks" do
    field :completed, :string
    field :desc, :string
    field :time, :integer
    field :title, :string
    field :user, :integer

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :user, :time, :completed])
    |> validate_required([:title, :desc, :user, :time, :completed])
  end
end
