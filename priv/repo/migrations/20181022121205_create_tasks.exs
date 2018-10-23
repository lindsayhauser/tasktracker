defmodule TaskTracker.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string, null: false
      add :desc, :text, null: true
      add :user_id, references(:users, on_delete: :delete_all), null: false, default: 0
      add :completed, :boolean, default: false, null: false
      timestamps()
    end
  end
end
