class CreateCurrencies < ActiveRecord::Migration[6.1]
  def change
    create_table :currencies do |t|
      t.string :name
      t.string :symbol
      t.float :market_cap_usd
      t.float :price_usd
      t.float :change_percent_24hr
      t.timestamps
    end
  end
end
