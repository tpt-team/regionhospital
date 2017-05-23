class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def after_sign_in_path_for(resource)
    user_root_path
  end

  def require_user
    redirect_to root_path, notice: 'Щоб зробити цю дію потрібно авторизуватися' unless current_user
  end

  def check_card
    redirect_to new_card_path, notice: t('cards.has_no_card') if card_needed?
  end

  def card_needed?
    current_user && !current_user.card? && !current_user.doctor?
  end
end
