Rails.application.routes.draw do
  root 'welcome#index'
  post 'check_translation' => 'welcome#check_translation'
  resources :cards
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
