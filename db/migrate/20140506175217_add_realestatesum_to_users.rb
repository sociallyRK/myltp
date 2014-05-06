class AddRealestatesumToUsers < ActiveRecord::Migration
  def change
    add_column :users, :Realestatesum, :float, default: 0
  end
end
