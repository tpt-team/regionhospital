class DoctorsController < ApplicationController
  before_action :set_doctors, only: :index

  def show
    @doctor = User.find(params[:id])
  end

  private

  def set_doctors
    @doctors ||= DoctorsProfile.where(speciality: params[:department]).map(&:user)
  end
end
