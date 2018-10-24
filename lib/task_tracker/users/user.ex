defmodule TaskTracker.Users.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :admin, :boolean, default: false, null: false
    field :email, :string
    field :manager, :integer, default: 1, null: false   # the default manager is always user 1, who is alice right now. She is the CEO
    has_many :task, TaskTracker.Tasks.Task # A user has many tasks assigned to them
    has_many :employees, TaskTracker.Users.User, foreign_key: :manager
    # A user also has many underlings (who this user manages)

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :admin, :manager])
    # |> unique_constraint(:email)
    |> validate_required([:email, :admin, :manager])
  end
end
