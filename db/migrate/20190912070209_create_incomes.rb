class CreateIncomes < ActiveRecord::Migration[5.2]
  def change
    create_table :incomes do |t|
      t.string :name, null: false  #科目の名前（給料など。）
      t.string :description  #備考（科目の補足説明）
      t.timestamps
    end
  end
end
