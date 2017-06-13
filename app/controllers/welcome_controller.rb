class WelcomeController < ApplicationController
  before_action :set_locale
  before_action :check_card

  def index; end

  private

  def set_locale
    I18n.locale = :ua
  end
end
