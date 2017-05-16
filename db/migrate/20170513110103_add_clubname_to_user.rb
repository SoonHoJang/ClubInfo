class AddClubnameToUser < ActiveRecord::Migration
  def change
    add_column :users, :clubname, :string
  end
end
