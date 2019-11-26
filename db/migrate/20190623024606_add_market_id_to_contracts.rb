class AddMarketIdToContracts < ActiveRecord::Migration[5.2]
  def change
    change_table :contracts do |t|

      t.integer "market_id"
    end
  end
end
