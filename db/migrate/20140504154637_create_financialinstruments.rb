class CreateFinancialinstruments < ActiveRecord::Migration
  def change
    create_table :financialinstruments do |t|
      t.string :instrument_type
      t.string :instrument_sub
      t.integer :amount
      t.references :user, index: true

      t.timestamps
    end
  end
end
