class CreateFixedcosts < ActiveRecord::Migration[5.2]
  def change
    create_table :fixedcosts do |t|
      t.string :name, null: false
      t.string :description
      t.integer :user_id, foreign_key: true, null: false
      t.timestamps
    end
  end
end
