class DoctorsController < ApplicationController
  def index
    @doctors = User.doctors
  end
end
