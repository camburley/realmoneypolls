class CreateValues < ActiveRecord::Migration[5.2]
  def change
    create_table :values do |t|

      t.bigint "contract_id"
      t.decimal "last_trade_price"
      t.decimal "best_buy_yes_offer"
      t.decimal "best_buy_no_offer"
      t.decimal "best_sell_yes_price"
      t.decimal "best_sell_no_price"
      t.decimal "last_close_price"
      t.timestamps
    end
  end
end
