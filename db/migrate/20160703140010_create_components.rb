class CreateComponents < ActiveRecord::Migration[5.0]
  def change
    create_table :components do |t|
      t.references :system, foreign_key: true
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
