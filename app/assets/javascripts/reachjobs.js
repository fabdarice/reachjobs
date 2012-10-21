function remove_fields(link, classname) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest("." + classname).hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $('#list_' + association).append(content.replace(regexp, new_id));
  $('#list_' + association).children(":last").find('input[type=hidden][name*="position"]').attr('value', new_id);
  $.scrollTo($('#list_' + association).children(":last"), 800);
  $('#list_' + association).children(":last").find('.one_section_content').find('input[type=text]').first().focus();
  $('#list_' + association).children(":last").find('.skill_autocomplete').autocomplete({lookup:list_of_skills});

}

function tab_to_display(tabname) {
  $("div.show").removeClass("show").addClass("hide");
  $("#" + tabname).closest(".hide").removeClass("hide").addClass("show");
}

function move_higher(link, classname) {
  var $div_to_move = $(link).closest("." + classname);

  if (!$div_to_move.prevAll("." + classname).length){
    return false;
  }
  else {
    var $div_before = $div_to_move.prevAll("." + classname).eq(0);
    $div_before.before($div_to_move);
    var $div_before_position = $div_before.children('input[type=hidden][name*="position"]').val();
    var $div_to_move_position = $div_to_move.children('input[type=hidden][name*="position"]').val();
    $div_to_move.children('input[type=hidden][name*="position"]').val($div_before_position);
    $div_before.children('input[type=hidden][name*="position"]').val($div_to_move_position);
  }
}

function move_lower(link, classname) {
  var $div_to_move = $(link).closest("." + classname);

  if (!$div_to_move.nextAll("." + classname).length){
    return false;
  }
  else {
    var $div_after = $div_to_move.nextAll("." + classname).eq(0);
    $div_to_move.before($div_after);
    var $div_after_position = $div_after.children('input[type=hidden][name*="position"]').val();
    var $div_to_move_position = $div_to_move.children('input[type=hidden][name*="position"]').val();
    $div_to_move.children('input[type=hidden][name*="position"]').val($div_after_position);
    $div_after.children('input[type=hidden][name*="position"]').val($div_to_move_position);
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
    var regexp = new RegExp("new_" + association, "g");

    $(link).parent().before(content.replace(regexp, new_id));
    $(link).parent().siblings(":last").find('input.input_skill').attr('value', skillname);
    $(link).parent().siblings(":last").find('input.input_skill').attr('size', skillname.length);  
  }  
}


function go_to_anchor(link_number) {
  $.scrollTo($('#profile_resume').find('.profile_title').eq(link_number), 800);

}