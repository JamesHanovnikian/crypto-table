Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/currencies" => "currencies#index"
  post "/by_price" => "currencies#by_price"
end
