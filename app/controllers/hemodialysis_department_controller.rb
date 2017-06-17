class HemodialysisDepartmentController < ApplicationController
  before_action :set_locale
  layout 'hemo_layout'

  private

  def set_locale
    I18n.locale = session[:locale] || I18n.default_locale
  end
end
