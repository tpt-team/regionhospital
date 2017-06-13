class PatientsController < ApplicationController
  def index
    @patients = User.patients
  end

  def show
    @patient = User.find(params[:id])
  end
end
