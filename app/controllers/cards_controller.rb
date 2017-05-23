class CardsController < ApplicationController
  before_action :require_user, only: :create
  before_action :set_card, only: %w(new create)

  def create
    @card.assign_attributes(card_params)
    if @card.save
      redirect_to user_root_path, notice: t('cards.created_card')
    else
      render :new
    end
  end

  private

  def set_card
    @card ||= current_user.build_card
  end

  def card_params
    params.require(:card).permit(:first_name, :last_name, :surname, :home_phone,
                                 :work_phone, :dispancery, :gender, :preferential_number,
                                 :location, :job_info, :contingent, :preferential_categories)
  end
end
