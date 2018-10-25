# TaskTracker

## Design choices:

Notable Example Users in App:
`dumbledore@example.com` is the only admin user
`mcgonagall@example.com` manages over 3 different users
`hagrid@example.com` does not manage over anyone

Registering Users:
  * When registering a user, it now requires a user to select a manager who will manage them. There is a dropdown of all users provided on the front end such that a user can't register themselves to a user who doesn't exit.
  * The User's table in the database has a new column called "manager" which is the id of a users already in the system who is the user's manager.
  * A user can only have one manager.
  * A user can be his or her own manager - this is because a user might not have a manager (they could be CEO of a company).
  * A person who is their own manager can assign themselves Tasks since they manage themselves and want to track their own tasks
  * A manager can only assign tickets to those users that they manage over. In order to control this, there is a dropdown on the front end such that when assigning a user, a manager can only see a dropdown of users that they have access to

Showing Users / User Profile
  * When clicking "Users" tab, only an admin user can see the edit and delete buttons that allow them to change a user's profile, so that a normal user cannot change their profile. However, the URL calls are still there if a user were to type it in to edit a user.
  * A user's profile page shows the people that they manage (their underlings), and also a list of tasks (Task Report) of the status of tasks that their underlings have been assigned.
  * There are button links to the user pages that this user manages over and links to the underling's tasks in the task report.

Tasks:
  * The "start working" "stop working" button appears on a task's page. If there is a timeblock open that does not have an end time, then the button will appear as "stop working" and it will end that time block when clicked. If there are no current time block open, the button will appear as "start working" and clicking it will cause a new timeblock to be formed.
  * Upon clicking the stop working/start working button, the UI automatically refreshes so that the user can see the changes immediately.
  * In order to edit a timeblock, a user must scroll to the `Manually Edit Times:` section on a task's page and enter the timeblock id and new vales in each field in the fields. Upon clicking the `Update Time` button, the UI will refresh. If there is no UI refresh, the update did not go through due to a input error.
  * In order to fully delete a timeblock, enter the timeblock id in the input field next to the delete button and click `Delete`. If the timeblock id is correct, the UI will update and changes will be reflected.


#
