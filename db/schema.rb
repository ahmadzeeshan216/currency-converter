
ActiveRecord::Schema.define(version: 2022_05_29_211346) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "currency_conversions", force: :cascade do |t|
    t.integer "from", limit: 2, null: false
    t.integer "to", limit: 2, null: false
    t.decimal "actual_amount", null: false
    t.decimal "converted_amount"
  end

end
