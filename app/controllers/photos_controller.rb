class PhotosController < ApplicationController
  def show
    @image = Record.find(params[:id]).image_url
  end
end
