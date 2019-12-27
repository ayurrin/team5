Rails.application.routes.draw do
  get "posts/index" => "posts#index"

  devise_for :users
  get 'home/top' => "home#top"
  resource :passwords, only: [:create]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => "home#top"

  get '/posts' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

end
