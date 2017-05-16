class AddAuclubToUser < ActiveRecord::Migration
  def change
    add_reference :users, :auclub, index: true, foreign_key: true
  end
end
