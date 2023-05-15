# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

response = HTTP.get("https://api.coincap.io/v2/assets")

crypto_currencies = response.parse(:json)

currencies = crypto_currencies["data"]

currencies.each do |currency|
  c = Currency.new(
    name: currency["name"],
    symbol: currency["symbol"],
    market_cap_usd: currency["marketCapUsd"],
    price_usd: currency["priceUsd"],
    change_percent_24hr: currency["changePercent24Hr"],
  )
  c.save
end
