defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :desc, :text
      add :user_id, references(:users, on_delete: :nothing)
      add :time_hours, :integer
      add :time_minutes, :integer
      add :completed, :boolean, default: false, null: false

      timestamps()
    end

  end
end
