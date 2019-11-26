class AddJsonToValues < ActiveRecord::Migration[5.2]
  def change
    change_table :values do |t|
    
    change_column :values, :last_trade_price, :integer, array: true, default: []
    change_column :values, :best_buy_yes_offer, :integer, array: true, default: []
    change_column :values, :best_buy_no_offer, :integer, array: true, default: []
    change_column :values, :best_sell_yes_price, :integer, array: true, default: []
    change_column :values, :best_sell_no_price, :integer, array: true, default: []
    change_column :values, :last_close_price, :integer, array: true, default: []
      
    end
  end
end
