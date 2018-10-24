defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :title, :string
    belongs_to :user, TaskTracker.Users.User
    has_many :timeblock, TaskTracker.Timeblocks.Timeblock

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :user_id, :timeblock_id, :completed])
    |> validate_required([:title, :desc, :user_id, :timeblocks_id, :completed])
  end
end
