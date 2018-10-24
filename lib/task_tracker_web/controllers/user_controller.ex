defmodule TaskTrackerWeb.UserController do
  use TaskTrackerWeb, :controller

  alias TaskTracker.Users
  alias TaskTracker.Users.User
  alias TaskTracker.Tasks


  def index(conn, _params) do
    users = Users.list_users()
    render(conn, "index.html", users: users)
  end

  def new(conn, _params) do
    changeset = Users.change_user(%User{})
    all_users = Users.list_users;
    render(conn, "new.html", changeset: changeset, all_users: all_users)
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create_user(user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User created successfully.")
        |> put_session(:user_id, user.id)
        |> redirect(to: Routes.user_path(conn, :show, user))  #user

      {:error, %Ecto.Changeset{} = changeset} ->
        all_users = Users.list_users;
        render(conn, "new.html", changeset: changeset, all_users: all_users)
    end
  end

  def show(conn, %{"id" => id}) do
    user = Users.get_user!(id)  # get user to display
    manager = Users.get_user!(user.manager) # get the user's managers
    ids = Users.getMangagedUserIds(user.id) # get the id's of the underlings
    tasks = Tasks.getTasks(ids);  # get all the tasks of the underlings
    render(conn, "show.html", user: user, manager: manager, tasks: tasks)
  end

  def edit(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    changeset = Users.change_user(user)
    all_users = Users.list_users;
    render(conn, "edit.html", user: user, changeset: changeset, all_users: all_users)
  end

  def update(conn, %{"id" => id, "user" => user_params}) do
    user = Users.get_user!(id)
    all_users = Users.list_users;

    case Users.update_user(user, user_params) do
      {:ok, user} ->
        conn
        |> put_flash(:info, "User updated successfully.")
        |> redirect(to: Routes.user_path(conn, :show, user))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", user: user, changeset: changeset, all_users: all_users)
    end
  end

  def delete(conn, %{"id" => id}) do
    user = Users.get_user!(id)
    {:ok, _user} = Users.delete_user(user)

    conn
    |> put_flash(:info, "User deleted successfully.")
    |> redirect(to: Routes.user_path(conn, :index))
  end
end
