Rails.application.routes.draw do
  get "posts/index" => "posts#index"
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "likes/show/:id" => "likes#show"

  devise_for :users
  get '/' => "home#top"
  resource :passwords, only: [:create]

    

  get '/posts' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

end
