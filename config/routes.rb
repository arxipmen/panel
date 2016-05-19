Rails.application.routes.draw do
  root 'admin#index'

  resources :city, :country, :region, :tourist_base

end
