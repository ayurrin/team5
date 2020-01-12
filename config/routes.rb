Rails.application.routes.draw do
  post "likes/:post_id/create" => "likes#create"
  post "likes/:post_id/destroy" => "likes#destroy"
  get "likes/show/:id" => "likes#show"

  devise_for :users, :controllers => {
    :sessions      => "users/sessions",
    :registrations => "users/registrations",
    :passwords     => "users/passwords",
  }
  resources :users, only: [:index, :show]
  put 'users/follow/:user_id' => 'users#follow'
  put 'users/unfollow/:user_id' => 'users#unfollow'
  #フォローとフォローを外すアクション

  get 'users/follow_list/:user_id' => 'users#follow_list'
  get 'users/follower_list/:user_id' => 'users#follower_list'
  get 'users/timeline/:user_id' => 'users#timeline'
  #フォロー・フォロワーの一覧ページ
  get 'home/top' => "home#top"
  resource :passwords, only: [:create]


  get '/' => "home#top"
  get '/maps' => "maps#index"


  get '/posts' => "posts#index"
  get "posts/new" => "posts#new"
  get "posts/:id" => "posts#show"
  get "user/posts/:id" => "posts#mypost"
  post "posts/create" => "posts#create"
  get "posts/:id/edit" => "posts#edit"
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"

  get 'maps/:id'  => "maps#index"
  # root to: 'maps#index'
  # resources :maps, only: [:index]

end
