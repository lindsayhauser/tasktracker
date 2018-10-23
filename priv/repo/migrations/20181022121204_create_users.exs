defmodule TaskTracker.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :admin, :boolean, default: false, null: false
      add :manager, :integer, default: 0, null: false
      timestamps()
    end

  end
end
