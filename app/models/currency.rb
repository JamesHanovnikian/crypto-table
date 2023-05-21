class Currency < ApplicationRecord
  COINCAP_API = "https://api.coincap.io/v2/assets"

  def self.destroy_and_import_all!
    destroy_all
    response = HTTP.get(COINCAP_API)

    crypto_currencies = response.parse(:json)

    currencies = crypto_currencies.fetch("data")
    currencies.each do |currency|
      c = new(
        name: currency["name"],
        symbol: currency["symbol"],
        market_cap_usd: currency["marketCapUsd"],
        price_usd: currency["priceUsd"],
        change_percent_24hr: currency["changePercent24Hr"],
      )
      if c.save
        Rails.logger.info("#{c.name} imported")
      else
        raise "#{c.name} could not be imported"
      end
    end
  end
end
