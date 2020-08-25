class CreateCheckups < ActiveRecord::Migration[6.0]
  def change
    create_table :checkups do |t|
      t.date :realized_on
      t.references :user, null: false, foreign_key: true
      t.string :laboratory_name

      t.timestamps
    end
  end
end
