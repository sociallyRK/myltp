class CreateRealEstates < ActiveRecord::Migration
  def change
    create_table :real_estates do |t|
      t.string :zipaddress
      t.string :zipcity
      t.integer :zipcode
      t.integer :zipid
      t.integer :zestimate
      t.string :zillow_link
      t.references :financial_instrument, index: true
      t.references :user, index: true

      t.timestamps
    end
  end
end
