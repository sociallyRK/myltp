class CreateRealestates < ActiveRecord::Migration
  def change
    create_table :realestates do |t|
      t.string :zipaddress
      t.string :zipcity
      t.integer :zipcode
      t.integer :zipid
      t.integer :zestimate
      t.string :zillow_link
      t.references :financialinstrument, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
