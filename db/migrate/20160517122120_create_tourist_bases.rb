class CreateTouristBases < ActiveRecord::Migration
  def change
    create_table :tourist_bases do |t|
      t.string  :name
      t.integer :city_id
      t.text    :description
      t.string  :phone

      t.timestamps null: false
    end
  end
end
