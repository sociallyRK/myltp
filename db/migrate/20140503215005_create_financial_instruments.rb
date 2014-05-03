class CreateFinancialInstruments < ActiveRecord::Migration
  def change
    create_table :financial_instruments do |t|
      t.string :instrument_type
      t.string :instrument_sub
      t.integer :amount
      t.references :user, index: true

      t.timestamps
    end
  end
end
