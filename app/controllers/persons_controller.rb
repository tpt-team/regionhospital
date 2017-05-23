class PersonsController < ApplicationController
  before_action :check_card

  def profile
    @card = current_user.card
  end
end
