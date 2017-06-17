class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.datetime :booked_time
      t.integer :patient_id
      t.integer :doctor_id

      t.timestamps
    end
  end
end
