Rails.application.routes.draw do
  get 'posts/index'
  root to: 'homes#top'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  resources :posts
end
