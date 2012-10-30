class SkillcategoriesController < ApplicationController
  def new
    @skillcategory = Skillcategory.new
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def create
    @skillcategory = current_user.profile.skillcategories.build(params[:skillcategory])
    if (@skillcategory.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @skillcategory = Skillcategory.find(params[:id])
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def update
    @skillcategory = Skillcategory.find(params[:id])
    if @skillcategory.update_attributes(params[:skillcategory])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @skillcategory = Skillcategory.find(params[:id])
    @skillcategory.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
