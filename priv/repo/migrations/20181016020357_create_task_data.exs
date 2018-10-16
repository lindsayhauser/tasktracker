defmodule TaskTracker.Repo.Migrations.CreateTaskData do
  use Ecto.Migration

  def change do
    create table(:task_data) do
      add :title, :string
      add :desc, :text
      add :user, :string
      add :time, :integer
      add :completed, :string

      timestamps()
    end

  end
end
