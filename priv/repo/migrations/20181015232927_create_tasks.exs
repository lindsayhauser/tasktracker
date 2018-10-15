defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :desc, :text
      add :user, :integer
      add :time, :integer
      add :completed, :string

      timestamps()
    end

  end
end
