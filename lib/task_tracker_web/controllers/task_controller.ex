defmodule TaskTrackerWeb.TaskController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Tasks
  alias TaskTracker.Tasks.Task
  alias TaskTracker.Users


  def index(conn, _params) do
    tasks = Tasks.list_task_list()
    render(conn, "index.html", tasks: tasks)
  end

  def new(conn, _params) do
    changeset = Tasks.change_task(%Task{})
    user = TaskTracker.Users.get_user(get_session(conn, :user_id) || -1)
    manage_user_list = Users.list_users_managed_over(user.id)
    render(conn, "new.html", changeset: changeset, manage_user_list: manage_user_list)
  end

  def create(conn, %{"task" => task_params}) do
    case Tasks.create_task(task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task created successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        user = TaskTracker.Users.get_user(get_session(conn, :user_id) || -1)
        manage_user_list = Users.list_users_managed_over(user.id)
        render(conn, "new.html", changeset: changeset, manage_user_list: manage_user_list)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    user_list = Users.list_users()
    render(conn, "show.html", task: task, user_list: user_list)
  end

  def edit(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    changeset = Tasks.change_task(task)
    manage_user_list = Users.list_users_managed_over(id)
    render(conn, "edit.html", task: task, changeset: changeset, manage_user_list: manage_user_list)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Tasks.get_task!(id)

    case Tasks.update_task(task, task_params) do
      {:ok, task} ->
        conn
        |> put_flash(:info, "Task updated successfully.")
        |> redirect(to: Routes.task_path(conn, :show, task))

      {:error, %Ecto.Changeset{} = changeset} ->
        manage_user_list = Users.list_users_managed_over(id)
        render(conn, "edit.html", task: task, changeset: changeset, manage_user_list: manage_user_list)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Tasks.get_task!(id)
    {:ok, _task} = Tasks.delete_task(task)

    conn
    |> put_flash(:info, "Task deleted successfully.")
    |> redirect(to: Routes.task_path(conn, :index))
  end
end
