class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.string :name
      t.string :phone
      t.references :auclub, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
