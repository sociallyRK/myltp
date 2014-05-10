class CreateRealestates < ActiveRecord::Migration
  def change
    create_table :realestates do |t|
      t.string :zipaddress
      t.string :zipcity
      t.integer :zipcode
      t.integer :zipid
      t.decimal :zestimate, :precision => 8, :scale => 2
      t.string :zillow_link
      t.references :financialinstrument, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
