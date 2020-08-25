class CreateUserAnalyses < ActiveRecord::Migration[6.0]
  def change
    create_table :user_analyses do |t|
      t.string :name
      t.float :value
      t.references :analysis, null: false, foreign_key: true
      t.references :checkup, null: false, foreign_key: true

      t.timestamps
    end
  end
end
