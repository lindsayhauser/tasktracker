# TaskTracker

## Design choices:
  * When Registering a user, it now requires a user to select a manager who will manage them. There is a dropdown of all users provided on the front end such that a user can't register themselves to a user who doesn't exit.
  * The User's table in the database has a new column called "manager" which is the id of a users already in the system who is the user's managers
  * A user can be it's own manager - this happens because in a company at some point there is the head of tasks and they don't have a manager. A person who is their own manager can give themselves Tasks.
  * A manager can now only assign tickets to those users that they manage over. In order to control this, there is a dropdown on the front end such that a user can only select those users whom they have access over to
  * Nnow, only an admin can see the button that allows them to edit a user's profiel (change manager for example) This is so that a users can't change their settings.
  howver, the URL calls are still there if a user were to type it in.
  * The "start working" "stop workig" buttton appears on teh task page. If there is a timeblock open that does not have an end time, then the button will appear as "stop working" and it will end that time block. If there are no current time block open, the button will appear as "start working" and clicking it will cause a new timeblock to be formed.

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
