class CreatePositions < ActiveRecord::Migration[5.2]
  def change
    create_table :positions do |t|

      t.bigint "user_id"
      t.string "contract_id"
      t.string "market_id"
      t.integer "numOfShares"
      t.string "market_type"
      t.string "contract_type"
      t.decimal "buy_price"
      t.string "buy_id"
      t.string "current_value"
      t.boolean "trackPosition", default: false 
      t.timestamps
    end
  end
end
