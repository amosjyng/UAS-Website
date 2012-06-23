$(document).ready(function () {
  // I have a feeling this is a very stupid way to do things
  var path = window.location.pathname;
  officers = path.indexOf("officers") >= 0;
  events = path.indexOf("events") >= 0;
  if (officers) $("#officers_nav").attr("id","selected");
  if (events) {
  	$("#events_nav").attr("id","selected");
  	$("#content").css("border-top-left-radius","0 0")
  }
})