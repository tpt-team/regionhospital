class DoctorsProfile < ApplicationRecord
  belongs_to :user

  def blank?
    bio.blank? && full_name.blank? && speciality.blank?
  end
end
