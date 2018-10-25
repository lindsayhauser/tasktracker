//TODO cleanup
// Taken from Nat Tuck's Lecture Notes
// http://www.ccs.neu.edu/home/ntuck/courses/2018/09/cs4550/notes/10-crud/notes.html

// We need to import the CSS so that webpack will load it.
// The MiniCssExtractPlugin is used to separate it out into
// its own CSS file.
import css from "../css/app.scss";

// webpack automatically bundles all modules in your
// entry points. Those entry points can be configured
// in "webpack.config.js".
//
// Import dependencies
//
import "phoenix_html";
import jQuery from 'jquery';
window.jQuery = window.$ = jQuery;
import "bootstrap";
import _ from "lodash";

$(function () {
  $('#stop-end-button').click((ev) => {
    let user_id = $(ev.target).data('user-id');
    let task_id = $(ev.target).data('task-id');
    let action_id = $(ev.target).data('action-id'); //if we have to start or stop

    let text = JSON.stringify({
      timeblock: {
        manual: false,
        user_id: user_id,
        task_id: task_id,
        stop_end_button: true
      },
    });

    // We want to update the stop
    if(action_id) {
        $.ajax(`ajax/timeblocks/${task_id}`, {
        method: "put",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: text,
        success: (resp) => {
          console.log("Successfully got back from the thing after updating the stop ")
          location.reload(true)
        },
      });
    }
    // Otherwise we want to create a new time-block
    else {
    $.ajax(`ajax/timeblocks/`, {
        method: "post",
        dataType: "json",
        contentType: "application/json; charset=UTF-8",
        data: text,
        success: (resp) => {
          console.log("Successfully got back from the thing after creating a new time block")
          location.reload(true)
        },
      });
    }
  });
});

// Deleting a time block
$(function () {
  $('#delete_task_button').click((ev) => {
    let timeblock_id = $('#delete_number').val()

    let text = JSON.stringify({
      timeblock: {
        timeblock_id: timeblock_id
      },
    });

    $.ajax(`ajax/timeblocks/${timeblock_id}`, {
    method: "delete",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    success: (resp) => {
      console.log("Successfully got back from the thing after deleting")
      location.reload(true)
    },
  });
  });
});

// Updating a time block
$(function () {
  $('#update_time_button').click((ev) => {
    let timeblock_id = $('#block_id_edit').val()
    let start_date_year = $('#start_date_year').val()
    let start_date_month = $('#start_date_month').val()
    let start_date_day = $('#start_date_day').val()
    let start_time_hour = $('#start_time_hour').val()
    let start_time_minute = $('#start_time_minute').val()
    let start_time_second = $('#start_time_second').val()
    let end_date_year = $('#end_date_year').val()
    let end_date_month = $('#end_date_month').val()
    let end_date_day = $('#end_date_day').val()
    let end_time_hour = $('#end_time_hour').val()
    let end_time_minute = $('#end_time_minute').val()
    let end_time_second = $('#end_time_second').val()

    let currently_ongoing = false

    let text = JSON.stringify({
      timeblock: {
        manual: true,
        timeblock_id: timeblock_id,
        start_date_year: start_date_year,
        start_date_month: start_date_month,
        start_date_day: start_date_day,
        start_time_hour: start_time_hour,
        start_time_minute: start_time_minute,
        start_time_second: start_time_second,
        end_date_year: end_date_year,
        end_date_month: end_date_month,
        end_date_day: end_date_day,
        end_time_hour: end_time_hour,
        end_time_minute: end_time_minute,
        end_time_second: end_time_second,
        currently_ongoing: currently_ongoing
      },
    });

    console.log("sending the ajax call")
    console.log(timeblock_id)
    console.log("??")
    $.ajax(`ajax/timeblocks/${timeblock_id}`, {
    method: "put",
    dataType: "json",
    contentType: "application/json; charset=UTF-8",
    data: text,
    success: (resp) => {
      console.log("Successfully got back from the thing after deleting")
      location.reload(true)
    },
  });
});
});
