class CurrenciesController < ApplicationController
  def index
    currencies = Currency.all
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
    if currency.save
      render json: currency.as_json
    else
      render json: { message: "Did not save currency properly." }, status: :unprocessable_entity
    end
  end
end
