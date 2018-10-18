# TaskTracker

## Design choices:
  * When viewing all tasks, descriptions are not displayed. This is because the descriptions may be long and when viewing all of the tasks, the user does not need to view description. If they wish to see the full task, they can click the show button
  * When creating a task, you are able to enter a user who is not registered for the site. This is because when making tasks, it is not always guaranteed that all assignees have registered on the site already. This also means if a user is deleted from the site, their name stays appearing on the task because we want to keep it for tracking purposes.
  * For the tasks database resource, the title, description and user fields are strings. The time tracking is kept track of two variables, both ints. time_hours keeps track of the hours a user inputted, and time_minutes keeps track of the minutes a user spent.
  * On the front end when a user updates the time spent on a task, the UI ensures that they can only enter in minutes of 15 minute increments


  id | title | desc | user | time_hours | time_minutes | completed | inserted_at | updated_at


To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
