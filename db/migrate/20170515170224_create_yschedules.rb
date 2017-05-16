class CreateYschedules < ActiveRecord::Migration
  def change
    create_table :yschedules do |t|
      t.integer :period, default: 0, null: false
      t.string :title
      t.text :content
      t.references :auclub, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
