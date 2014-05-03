// Toggling for active/inactive
$(document).ready(function(){

    $(".stu-active-toggle").addClass("active");
    $(".inactive-families").hide();

});

$(".family-inactive-toggle").click(function(){
    $(".inactive-family").show();
    $(".active-family").hide();
});
$(".family-active-toggle").click(function(){
    $(".active-family").show();
    $(".inactive-family").hide();
});