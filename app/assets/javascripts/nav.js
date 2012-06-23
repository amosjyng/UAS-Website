$(document).ready(function () {
  // I have a feeling this is a very stupid way to do things
  var path = window.location.pathname;
  if (path.indexOf("officers") >= 0) $("#officers_nav").attr("id","selected");
  if (path.indexOf("events") >= 0) $("#events_nav").attr("id","selected");
})