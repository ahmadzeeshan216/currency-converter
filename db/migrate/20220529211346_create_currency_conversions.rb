
class CreateCurrencyConversions < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_conversions do |t|
      t.integer :from, limit: 1, null: false
      t.integer :to, limit: 1, null: false
      t.numeric :actual_amount, null: false
      t.numeric :converted_amount
    end
  end
end
