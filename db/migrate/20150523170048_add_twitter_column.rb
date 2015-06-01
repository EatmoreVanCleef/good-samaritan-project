class AddTwitterColumn < ActiveRecord::Migration
  def change
    add_column :mayors, :twitter, :string
  end
end
