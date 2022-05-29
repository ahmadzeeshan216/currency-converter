
class CreateCurrencyConversions < ActiveRecord::Migration[6.0]
  def change
    create_table :currency_conversions do |t|
      t.string :from, limit: 3, null: false
      t.string :to, limit: 3, null: false
      t.numeric :actual_amount, null: false
      t.numeric :converted_amount
    end
  end
end
