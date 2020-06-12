class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.integer :how_many
      t.string :planting_schedule
      t.string :harvest
      t.string :location
      t.integer :gardener_id
    end
  end
end
