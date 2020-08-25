class CreateAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :analyses do |t|
      t.string :name
      t.text :description
      t.string :unit
      t.float :min_value
      t.float :max_value
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
