// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .
function remove_fields(link, classname) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("." + classname).hide();
}

function add_fields(link, association, content, position) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")

  if (position == "after")
    $(link).parent().append(content.replace(regexp, new_id));
  else
    $(link).parent().prepend(content.replace(regexp, new_id));
}

function tab_to_display(tabname) {
  $("div.show").removeClass("show").addClass("hide");
  $("#" + tabname).closest(".hide").removeClass("hide").addClass("show");
}

function move_higher(link, classname) {
  var $div_to_move = $(link).closest("." + classname);
  //alert($div_to_move.prev("." + classname).html());

  if (!$div_to_move.prevAll("." + classname).length){
    return false;
  }
  else {
    var $div_before = $div_to_move.prevAll("." + classname).eq(0);
    $div_before.before($div_to_move);
    //var $my_test2 = $(".skillcategory_fieldsremovable1");
    //$my_test2.css("background", "red");
    var $div_before_position = parseInt($div_before.children("input[type=hidden]").val()) + 1;
    var $div_to_move_position = parseInt($div_to_move.children("input[type=hidden]").val()) - 1;
    $div_to_move.children("input[type=hidden]").val($div_to_move_position);
    $div_before.children("input[type=hidden]").val($div_before_position);
  }
}

function move_lower(link, classname) {
  var $div_to_move = $(link).closest("." + classname);
  //alert($div_to_move.prev("." + classname).html());

  if (!$div_to_move.nextAll("." + classname).length){
    return false;
  }
  else {
    var $div_after = $div_to_move.nextAll("." + classname).eq(0);
    $div_to_move.before($div_after);
    //var $my_test2 = $(".skillcategory_fieldsremovable1");
    //$my_test2.css("background", "red");
    var $div_after_position = parseInt($div_after.children('input[type=hidden][name*="position"]').val()) - 1;
    var $div_to_move_position = parseInt($div_to_move.children('input[type=hidden][name*="position"]').val()) + 1;
    $div_to_move.children('input[type=hidden][name*="position"]').val($div_to_move_position);
    $div_after.children('input[type=hidden][name*="position"]').val($div_after_position);
  }
}

function set_visibility(link, classname) {
  var $div_visible = $(link).closest("." + classname);
  var visibility = $div_visible.children('input[type=hidden][name*="visible"]').val();


  if (visibility == 't') {
    $div_visible.children('input[type=hidden][name*="visible"]').val('f');
    $div_visible.find('.one_section_content').removeClass("visible").addClass("not_visible"); 
  }
  else {
    $div_visible.children('input[type=hidden][name*="visible"]').val('t');
    $div_visible.find('.one_section_content').removeClass("not_visible").addClass("visible");  
    }
  }

function add_skill_to_category(link, association, content) {
  var skillname = $(link).parent().children('input[name="new_skill"]').val();
  if (skillname == "") {
    return false; 
  }
  else {
    var new_id = new Date().getTime();
    var regexp = new RegExp("new_" + association, "g")

    $(link).parent().before(content.replace(regexp, new_id));
    $(link).parent().siblings(":last").find('input').val(skillname);
    $(link).parent().siblings(":last").find('input').attr('size', skillname.length - 1);  
  }  
}

$(document).ready(function() {
  $('div.one_skill').find('input').each(function(){ 
      $(this).attr('size', $(this).val().length - 1); 
    });
});


