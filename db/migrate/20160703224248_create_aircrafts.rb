class CreateAircrafts < ActiveRecord::Migration[5.0]
  def change
    create_table :aircrafts do |t|
      t.references :model, foreign_key: true
      t.string :name
      t.string :aircraft_registration

      t.timestamps
    end
  end
end
