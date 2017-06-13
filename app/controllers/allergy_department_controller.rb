class AllergyDepartmentController < ApplicationController
  before_action :set_locale
  layout 'allergy_layout'

  def index; end

  def advice; end

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
