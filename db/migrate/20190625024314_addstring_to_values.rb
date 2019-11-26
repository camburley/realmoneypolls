class AddstringToValues < ActiveRecord::Migration[5.2]
  def change
    change_table :values do |t|
    
      change_column :values, :last_trade_price, :string
      change_column :values, :best_buy_yes_offer, :string
      change_column :values, :best_buy_no_offer, :string
      change_column :values, :best_sell_yes_price, :string
      change_column :values, :best_sell_no_price, :string
      change_column :values, :last_close_price, :string
        
      end
  end
end
