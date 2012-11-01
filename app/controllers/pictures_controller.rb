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
end
