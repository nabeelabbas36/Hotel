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
//= require jquery_ujs
//= require twitter/bootstrap
//= require turbolinks
//= require bootstrap
//= require_tree .
//function for removing dynamic fields
function remove_fields(link) {
    $(link).previous("input[type=hidden]").value = "1";
    $(link).up(".fields").hide();
}
//function for adding dynamic fields
function add_fields(menus, association, content) {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g");
    $(menus).up().insert({
        before: content.replace(regexp, new_id)
    });
}
function get_regions()
{
    var id = $("#country_id").val();
    $.get("/admins/getlocations/" + id + "/get_regions", function(data) {
        $("#region_id").remove();
        $('.region').remove();
        $("#country_id").after(data);
    });
}
function get_cities()
{
    var id = $("#region_id").val();
    $.get("/admins/getlocations/" + id + "/get_cities", function(data) {
        $("#city_id").remove();
        $('.city').remove();
        $("#region_id").after(data);
    });
}

