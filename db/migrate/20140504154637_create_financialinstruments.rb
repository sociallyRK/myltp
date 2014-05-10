class CreateFinancialinstruments < ActiveRecord::Migration
  def change
    create_table :financialinstruments do |t|
      t.string :instrument_type
      t.string :instrument_sub
      t.decimal :amount, :precision => 8, :scale => 2
      t.references :user, index: true

      t.timestamps
    end
  end
end
