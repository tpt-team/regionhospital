class CardsController < ApplicationController
  before_action :require_user, only: :create
  before_action :set_card, only: %w(new create)
  before_action :card, only: %w(edit update)
  before_action :can_edit?, only: %w(edit update)

  def new
    @card.records.build
  end

  def create
    @card.assign_attributes(card_params)
    if @card.save
      redirect_to user_root_path, notice: t('cards.created_card')
    else
      render :new
    end
  end

  def update
    return redirect_to patient_path(@card.user) if @card.update(card_params)
    render :edit
  end

  def edit; end

  private

  def set_card
    @card ||= current_user.build_card
  end

  def card
    @card ||= Card.find(params[:id])
  end

  def can_edit?
    current_user.doctor
  end

  def card_params
    params.require(:card).permit(:first_name, :last_name, :surname, :home_phone,
                                 :work_phone, :dispancery, :gender,
                                 :preferential_number, :location, :job_info,
                                 :contingent, :preferential_categories, :disease,
                                 records_attributes: [:id, :body, :_destroy, :user_id, :card_id, :image])
  end
end
