Rails.application.routes.draw do
  # root 'welcome#index'

  resources :city, :country, :region, :tourist_base

end
