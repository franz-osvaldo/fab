class CreateSystems < ActiveRecord::Migration[5.0]
  def change
    create_table :systems do |t|
      t.references :model, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
