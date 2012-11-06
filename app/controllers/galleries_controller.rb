class GalleriesController < ApplicationController
  def new
    @gallery = Gallery.new
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def create
    @gallery = current_user.profile.galleries.build(params[:gallery])
    if (@gallery.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @gallery = Gallery.find(params[:id])
    @skills = Skill.pluck(:skill_name)
    @skills.map {|skill| skill}.join(',') 
  end

  def edit_pictures
    @gallery = Gallery.find(params[:id])
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update_attributes(params[:gallery])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end

  def images 
    @gallery = Gallery.find(params[:id])
    @picture = Picture.new
  end

  def edit_images
    @picture = Picture.new
    @gallery = Gallery.find(params[:id])
    
  end
end
