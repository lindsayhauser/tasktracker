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

#Repo.insert!(%User{email: "alice@example.com", admin: true, manager: 1})
#Repo.insert!(%User{email: "bob@example.com", admin: false, manager: 1})
#Repo.insert!(%Task{completed: false, desc: "The newest homework for object oriented design", title: "Finish OOD Homework", user_id: 1})


Repo.insert!(%User{email: "lindsay@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "andrew@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "jamie@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "sarah@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "olivia@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "alyssa@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "stephanie@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "alex@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "brandon@example.com", admin: false, manager: 1})
Repo.insert!(%User{email: "weiming@example.com", admin: false, manager: 1})

Repo.insert!(%User{email: "max@example.com", admin: false, manager: 2})
Repo.insert!(%User{email: "dylan@example.com", admin: false, manager: 2})
Repo.insert!(%User{email: "steve@example.com", admin: false, manager: 3})
Repo.insert!(%User{email: "shawn@example.com", admin: false, manager: 4})
Repo.insert!(%User{email: "gabriel@example.com", admin: false, manager: 4})
Repo.insert!(%User{email: "asap@example.com", admin: false, manager: 5})

Repo.insert!(%User{email: "cindy@example.com", admin: false, manager: 6})
Repo.insert!(%User{email: "mikasa@example.com", admin: false, manager: 7})
Repo.insert!(%User{email: "eren@example.com", admin: false, manager: 8})
Repo.insert!(%User{email: "reiner@example.com", admin: false, manager: 9})
Repo.insert!(%User{email: "bertholdt@example.com", admin: false, manager: 10})
Repo.insert!(%User{email: "nat@example.com", admin: false, manager: 11})
