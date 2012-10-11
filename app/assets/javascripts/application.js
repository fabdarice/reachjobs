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
    $(link).parent().after(content.replace(regexp, new_id));
  else
    $(link).parent().before(content.replace(regexp, new_id));
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