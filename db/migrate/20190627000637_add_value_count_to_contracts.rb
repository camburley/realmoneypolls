class AddValueCountToContracts < ActiveRecord::Migration[5.2]
  def change
    change_table :contracts do |t|
      t.integer "totalValues"
      end
  end
end
