class RemoveClubnameFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :clubname, :string
  end
end
