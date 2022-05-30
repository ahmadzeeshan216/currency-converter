Rails.application.routes.draw do
  resources :currency_conversions, shallow: true

  root to: 'currency_conversions#new'
end
