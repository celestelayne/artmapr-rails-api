class CreateArts < ActiveRecord::Migration
  def change
    create_table :arts do |t|
      t.string :title
      t.string :artist
      t.string :medium
      t.integer :venue_id
      t.float :latitude
      t.float :longitude

      t.timestamps null: false
    end
  end
end
