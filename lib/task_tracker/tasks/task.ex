defmodule TaskTracker.Tasks.Task do
  use Ecto.Schema
  import Ecto.Changeset

#   def change do
#     create table(:tasks) do
#       add :title, :string, null: false
#       add :desc, :text, null: true
#       add :user_id, references(:users, on_delete: :delete_all), null: false, default: 0
#       add :completed, :boolean, default: false, null: false
#       timestamps()
#     end
#   end
# end


  schema "tasks" do
    field :completed, :boolean, default: false
    field :desc, :string
    field :title, :string
    field :user_id, :string

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :desc, :user, :time_minutes, :completed, :time_hours])
    |> validate_required([:title, :user, :completed])
  end
end
