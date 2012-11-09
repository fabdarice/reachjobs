module ApplicationHelper

  #Use to display error message 
  def display_error(record, attr_name)
    if record.errors[attr_name].present?
      record.errors[attr_name].first
    end
  end

  def link_to_remove_fields(name, f, classname)
    f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this, \"#{classname}\")")
  end
  
  def link_to_add_fields(name, f, association, tabname)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s + "/profile_" + tabname + "_" + association.to_s, :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def link_to_add_skill_to_category(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render("skills/profile_resume_skills", :f => builder)
    end
    link_to_function(name, "add_skill_to_category(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def url_with_protocol(url)
    /^http/.match(url) ? url : "http://#{url}"
  end

end
