// Toggling for active/inactive
$(document).ready(function(){

//families
    $(".fam-active-toggle").addClass("active");
    $(".inactive-families").hide();

    $(".fam-active-toggle").addClass("active");
    $(".inactive-families").hide();    

//curriculums
    $(".curr-active-toggle").addClass("active");
    $(".inactive-curriculums").hide();

    $(".curr-active-toggle").addClass("active");
    $(".inactive-curriculums").hide();        

//instructors
    $(".ins-active-toggle").addClass("active");
    $(".inactive-instructors").hide();

    $(".ins-active-toggle").addClass("active");
    $(".inactive-instructors").hide();        
    
//locations
    $(".location-active-toggle").addClass("active");
    $(".inactive-locations").hide();

    $(".location-active-toggle").addClass("active");
    $(".inactive-locations").hide();  

//students
    $(".student-active-toggle").addClass("active");
    $(".inactive-students").hide();

    $(".student-active-toggle").addClass("active");
    $(".inactive-students").hide();  
});



//families
$(".fam-inactive-toggle").click(function(){
    $(".inactive-family").show();
    $(".active-family").hide();
});
$(".fam-active-toggle").click(function(){
    $(".active-family").show();
    $(".inactive-family").hide();
});

//curriculums
$(".curr-inactive-toggle").click(function(){
    $(".inactive-curriculum").show();
    $(".active-curriculum").hide();
});
$(".curr-active-toggle").click(function(){
    $(".active-curriculum").show();
    $(".inactive-curriculum").hide();
});


//instructors
$(".ins-inactive-toggle").click(function(){
    $(".inactive-instructor").show();
    $(".active-instructor").hide();
});
$(".ins-active-toggle").click(function(){
    $(".active-instructor").show();
    $(".inactive-instructor").hide();
});


//locations
$(".location-inactive-toggle").click(function(){
    $(".inactive-location").show();
    $(".active-location").hide();
});
$(".location-active-toggle").click(function(){
    $(".active-location").show();
    $(".inactive-location").hide();
});

//students
$(".student-inactive-toggle").click(function(){
    $(".inactive-student").show();
    $(".active-student").hide();
});
$(".student-active-toggle").click(function(){
    $(".active-student").show();
    $(".inactive-student").hide();
});


