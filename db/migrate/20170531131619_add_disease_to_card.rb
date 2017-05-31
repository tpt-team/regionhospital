class AddDiseaseToCard < ActiveRecord::Migration[5.0]
  def change
    add_column :cards, :disease, :string
  end
end
