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

// Update the UI times
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

    // $('#time_blocks tr').each(function(){
    // $(this).find('td').each(function(){
    //   var input = $(this).get(0)
    //   console.log(input)

      // let text = JSON.stringify({
      //   timeblock: {
      //     user_id: user_id,
      //     task_id: task_id,
      //     stop_end_button: false
      //   },
      // });

  //   })
  // })
    //console.log(table_contents)
  //   let text = JSON.stringify({
  //     timeblock: {
  //       user_id: user_id,
  //       task_id: task_id
  //     },
  //   });
  //
  });
});
