class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :name
      t.string :amount
      t.references :category, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: 'users' }, index: true

      t.timestamps
    end
  end
end
