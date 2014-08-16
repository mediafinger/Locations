class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string  :country
      t.string  :province
      t.string  :city
      t.string  :zip_code
      t.string  :street
      t.float   :latitude
      t.float   :longitude
      t.string  :search
      t.string  :result

      t.timestamps
    end
  end
end
