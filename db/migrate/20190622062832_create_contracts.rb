class CreateContracts < ActiveRecord::Migration[5.2]
  def change
    create_table :contracts do |t|

      t.string "status"
      t.bigint "contract_id"
      t.integer "market_id"
      t.string "image"
      t.string "url"
      t.string "name"
      t.string "long_name"
      t.datetime "date_end"
      t.timestamps
    end
  end
end
