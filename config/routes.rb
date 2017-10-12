Rails.application.routes.draw do
  get 'cards/index'

  root 'welcome#index'
  resources :cards, only: :index

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
