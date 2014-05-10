class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password_digest
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.integer :personal_income
      t.string :spouse_name
      t.date :spouse_birthday
      t.integer :spouse_income
      t.timestamps
    end
  end
end
