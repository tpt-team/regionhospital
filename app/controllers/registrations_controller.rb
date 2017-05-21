class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    User.create(user_params)
    redirect_to root_path
  end

  def update
    super
  end

  private

  def user_params
    params.require(:user).permit!
  end
end
