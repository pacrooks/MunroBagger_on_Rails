class CreateBaggedMunros < ActiveRecord::Migration
  def change
    create_table :bagged_munros do |t|
      t.references :user, index: true, foreign_key: true
      t.references :munro, index: true, foreign_key: true
      t.date :climbed_on

      t.timestamps null: false
    end
  end
end
