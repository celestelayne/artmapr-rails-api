class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :city

      t.timestamps null: false
    end
  end
end
