class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.references :user
      t.string :first_name
      t.string :last_name
      t.string :surname
      t.integer :gender
      t.boolean :dispancery
      t.string :home_phone
      t.string :work_phone
      t.string :location
      t.string :job_info
      t.string :contingent
      t.string :preferential_categories
      t.string :preferential_number

      t.timestamps
    end
  end
end
