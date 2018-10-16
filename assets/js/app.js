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

// Import local files
//
// Local files can be imported directly using relative paths, for example:
// import socket from "./socket"

// // We need to import the CSS so that webpack will load it.
// // The MiniCssExtractPlugin is used to separate it out into
// // its own CSS file.
// import css from "../css/app.css"
//
// // webpack automatically bundles all modules in your
// // entry points. Those entry points can be configured
// // in "webpack.config.js".
// //
// // Import dependencies
// //
// import "phoenix_html"
//
// // Import local files
// //
// // Local files can be imported directly using relative paths, for example:
// // import socket from "./socket"
