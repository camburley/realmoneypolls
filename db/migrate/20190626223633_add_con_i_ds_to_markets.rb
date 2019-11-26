class AddConIDsToMarkets < ActiveRecord::Migration[5.2]
  def change
    change_table :markets do |t|
      t.integer "contract_id", array: true, default: []
      end
  end
end
