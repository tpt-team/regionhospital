class PersonsController < ApplicationController
  before_action :check_card

  def profile
    @card = current_user.card
    @records = current_user.records
  end

  def update
    current_user.doctors_profile.update(doctors_profile_params)
    redirect_to user_root_path
  end

  private

  def doctors_profile_params
    params.require(:doctors_profile).permit(:bio, :full_name, :speciality)
  end
end
