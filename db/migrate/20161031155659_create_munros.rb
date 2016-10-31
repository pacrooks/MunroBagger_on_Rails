class CreateMunros < ActiveRecord::Migration
  def change
    create_table :munros do |t|
      t.string :name
      t.integer :height
      t.string :gridref_letters
      t.string :gridref_eastings
      t.string :gridref_northings
      t.float :latlng_lat
      t.float :latlng_lng
      t.string :smcid
      t.string :weatherid
      t.string :region
      t.string :meaning

      t.timestamps null: false
    end
  end
end
