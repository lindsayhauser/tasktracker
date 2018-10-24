defmodule TaskTracker.Repo.Migrations.CreateTimeblocks do
  use Ecto.Migration

  def change do
    create table(:timeblocks) do
      add :date_start, :date, null: false
      add :time_start, :time, null: false
      add :date_end, :date, null: true
      add :time_end, :time, null: true
      add :task_id, references(:tasks, on_delete: :delete_all), null: false
      add :currently_ongoing, :boolean  # Does this block have a start time but no end time? (is it currently running)

      timestamps()
    end

    create index(:timeblocks, [:task_id])
  end
end
