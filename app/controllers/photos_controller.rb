class PhotosController < ApplicationController
  def destroy
    @photo = Photo.find(params[:id])
    @product = @photo.product

    @photo.destroy

    redirect_to edit_product_path(@product), notice: "PHOTO DESTROYED WEUHHHHT!!?!?!!11?!"
  end
end
