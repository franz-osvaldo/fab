class CreateModels < ActiveRecord::Migration[5.0]
  def change
    create_table :models do |t|
      t.string :manufacturer
      t.string :model
      t.integer :capacity
      t.float :maximum_takeoff_weight

      t.timestamps
    end
  end
end
