Rails.application.routes.draw do
  resources :titles
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

get '/myblog', to: "blogposts#myblog", as: "myblog"
get '/allblog', to: "blogposts#allblog", as: "allblog"
get '/mostlikedblog', to: "blogposts#mostlikedblog", as: "mostlikedblog"
root 'blogposts#index'
get 'search', to: "blogposts#search"
get 'likedpost', to: "blogposts#likedpost"
resources :blogposts do 
  #post 'comments', to: 'comments#create'
  resources :comments, only: [:create, :destroy]
end
resources :liks, only: [:create, :destroy]

  # Defines the root path route ("/")
  # root "articles#index"
end
