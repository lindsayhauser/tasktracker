defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false, null: false
    field :email, :string
    field :manager, :integer, default: 0, null: false
    has_many :tasks, TaskTracker.Tasks.Task

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin, :manager])
    |> unique_constraint(:email)
    |> validate_required([:email, :admin, :manager])
  end
end
