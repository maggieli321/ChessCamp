// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.ui.all
//= require jquery_ujs
//= require jquery_nested_form
//= require foundation
//= require_tree .

$(document).ready(function() {
	$(".datepicker").datepicker({
		dateFormat: 'mm/dd/yy'
		// altField: "#actualDate"
	});
});

$(function(){ $(document).foundation(); });

// Autosubmit the quick registration form on the sections#show view
	// $(function() {
	// 	$('#registration_student_id').change(function()
	// 	 {
	// 	     $('#new_registration').submit();
	// 	 });
	// });
	
