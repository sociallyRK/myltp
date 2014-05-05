class AddStateToRealestates < ActiveRecord::Migration
  def change
    add_column :realestates, :zipstate, :string
  end
end
