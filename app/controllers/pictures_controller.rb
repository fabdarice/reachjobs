class PicturesController < ApplicationController
  def create
    @gallery = Gallery.find(params[:gallery_id])
    @picture = @gallery.pictures.build(params[:picture])
    if @picture.save
       render :text => @picture.avatar.url
    else
      flash[:error] = "Image Upload failed."  
    end
  end


  def update
    @picture = Picture.find(params[:id])
    if @picture.update_attributes(params[:picture])
       render :text => @picture.avatar.url
    end   
  end

  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    respond_to do |format|
        format.html { }
        format.js { }
     end
  end
end
