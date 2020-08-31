class AddCoordinatesToLaboratories < ActiveRecord::Migration[6.0]
  def change
    add_column :laboratories, :latitude, :float
    add_column :laboratories, :longitude, :float
  end
end
