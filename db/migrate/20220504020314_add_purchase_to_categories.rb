class AddPurchaseToCategories < ActiveRecord::Migration[7.0]
  def change
    add_reference :categories, :purchase, null: false, foreign_key: true
  end
end
