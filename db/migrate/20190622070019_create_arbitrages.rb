class CreateArbitrages < ActiveRecord::Migration[5.2]
  def change
    create_table :arbitrages do |t|

      t.bigint "user_id"
      t.string "buy_id"
      t.string "sell_id"
      t.decimal "price_per_share_diff"
      t.decimal "percentage_change"
      t.integer "investment_revenue"
      t.integer "investment_loss"
      t.timestamps
    end
  end
end
