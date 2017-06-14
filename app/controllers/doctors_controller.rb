class DoctorsController < ApplicationController
  def show
    @doctor = User.find(params[:id])
  end
end
