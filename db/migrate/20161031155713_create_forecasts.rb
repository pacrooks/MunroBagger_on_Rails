class CreateForecasts < ActiveRecord::Migration
  def change
    create_table :forecasts do |t|
      t.references :munro, index: true, foreign_key: true
      t.string :weatherid
      t.json :data

      t.timestamps null: false
    end
  end
end
