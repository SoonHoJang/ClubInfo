class CreateAuclubs < ActiveRecord::Migration
  def change
    create_table :auclubs do |t|
      t.string :name, null: false 
      t.text :introduce
      t.text :description, null: false
      t.integer :apply_time, null: false, default: 0
      t.string :meeting_time
      t.string :facebook
      t.string :tel, null: false
      t.string :logo
      t.integer :category, null: false, default: 0

      t.timestamps null: false
    end
  end
end
