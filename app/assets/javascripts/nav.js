$(document).ready(function () {
  if ($("selected").children().html() == 'Events') {
  	// we don't want the "Events" tab to look like it's not connected
  	// to the body
  	$("#content").css("border-top-left-radius","0 0")
  }
})