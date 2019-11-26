class CreateCashouts < ActiveRecord::Migration[5.2]
  def change
    create_table :cashouts do |t|

      t.bigint "user_id"
      t.string "contract_id"
      t.string "market_id"
      t.integer "numOfShares"
      t.string "market_type"
      t.string "contract_type"
      t.decimal "sharePrice_sold"
      t.string "sell_id"
      t.decimal "value_when_sold"
      t.timestamps
    end
  end
end
