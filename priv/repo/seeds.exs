# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     TaskTracker.Repo.insert!(%TaskTracker.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias TaskTracker.Repo
alias TaskTracker.Users.User
alias TaskTracker.Tasks.Task

Repo.insert!(%User{email: "alice@example.com", admin: true})
Repo.insert!(%User{email: "bob@example.com", admin: false})
Repo.insert!(%Task{completed: false, desc: "The newest homework for object oriented design", time_minutes: 15, time_hours: 1, title: "Finish OOD Homework", user: "alice@example.com"})
