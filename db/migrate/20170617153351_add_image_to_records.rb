class AddImageToRecords < ActiveRecord::Migration[5.0]
  def change
    add_column :records, :image, :string
  end
end
