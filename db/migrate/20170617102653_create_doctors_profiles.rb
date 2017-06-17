class CreateDoctorsProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors_profiles do |t|
      t.references :user
      t.text :bio
      t.string :full_name
      t.string :speciality
    end
  end
end
