class LanguagesController < ApplicationController
  def new
    @language = Language.new
  end

  def create
    @language = current_user.profile.languages.build(params[:language])
    if (@language.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "An error has occured."  
      render "new"
    end
  end

  def edit
    @language = Language.find(params[:id])
  end

  def update
    @language = Language.find(params[:id])
    if @language.update_attributes(params[:language])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @language = Language.find(params[:id])
    @language.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
