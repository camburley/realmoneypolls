class AddConCountToMarkets < ActiveRecord::Migration[5.2]
  def change
    change_table :markets do |t|
      t.integer "contract_count"
      end
  end
end
