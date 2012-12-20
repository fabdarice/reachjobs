class RecommendationsController < ApplicationController
  def new
    @recommendation = Recommendation.new
  end

  def create
    @recommendation = current_user.profile.recommendations.build(params[:recommendation])
    if (@recommendation.save)
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while creating the recommendation."  
      render "new"
    end
  end

  def edit
    @recommendation = Recommendation.find(params[:id])
  end

  def update
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.update_attributes(params[:recommendation])
      redirect_to show_edit_user_profile_path(current_user)
    else
      flash[:error] = "Error while saving the modifications."  
      render "edit"
    end 
  end

  def destroy
    @recommendation = Recommendation.find(params[:id])
    @recommendation.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end

end
