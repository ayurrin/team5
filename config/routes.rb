Rails.application.routes.draw do
  get 'home/top' => "home#top"
  get 'maps/index'
  root to: 'maps#index'
  resources :maps, only: [:index]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
