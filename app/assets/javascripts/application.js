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
	})});

	// var min;
	// var max;

	// $('#registration_camp_id').change(function(){
	// 	var e = $(this)[0];
	// 	min = parseInt(e.options[e.selectedIndex].getAttribute('min'));
	// 	max = parseInt(e.options[e.selectedIndex].getAttribute('max'));
	// 	//var student_select = $('#registration_student_id')[0];
	// 	//console.log(student_select.options)
	// 	// for (var i = 0;  i < student_select.options.length; i++){
	// 	// 	var student_rating = student_select.options[i].getAttribute('rating');
	// 	// 	//console.log(student_rating);
	// 	// 	if (student_rating <= min  && max >= student_rating){
	// 	// 		$('#registration_student_id')[0].options[i].setAttribute("display","none");
	// 	// 		console.log(student_select.options[i].getAttribute('rating'));
	// 	// 		console.log('hidden')
	// 	// 	} 
	// 	// }
	// });

	// 	$('#registration_student_id').change(function(){
	// 	$('#registration_button').attr('disabled', false);
	// 	var e = $(this)[0];
	// 	var student_rating = parseInt(e.options[e.selectedIndex].getAttribute('rating'));
	// 	//max = parseInt(e.options[e.selectedIndex].getAttribute('max'));
	// 	//var student_select = $('#registration_student_id')[0];
	// 	//console.log(student_select.options)
	// 	if (student_rating <= min  && max >= student_rating) {
	// 		$('#registration_button').attr('disabled', true);
	// 	}
	// });

	// });

$(function(){ $(document).foundation(); });

// Autosubmit the quick registration form on the sections#show view
	// $(function() {
	// 	$('#registration_student_id').change(function()
	// 	 {
	// 	     $('#new_registration').submit();
	// 	 });
	// });
	
