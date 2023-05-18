class CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
    @direction = true
    render json: currencies.as_json
  end

  def create
    currency = Currency.new(
      name: params[:name],
      symbol: params[:symbol],
      market_cap_usd: params[:market_cap_usd],
      price_usd: params[:price_usd],
      change_percent_24hr: params[:change_percent_24hr],
    )
    currency.save
    render json: currency.as_json
  end

  def by_price
    currencies = Currency.all
    column = params[:column]
    direction = params[:direction]
    p column
    if direction == true
      x = column + " " + "ASC"
      currencies.order!(x)
    else
      x = column + " " + "DESC"
      currencies.order!(x)
    end
    render json: currencies.as_json
  end
end
