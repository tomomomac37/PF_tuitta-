Rails.application.routes.draw do
  get 'homes/thanks'
  root to: 'posts#index'
  devise_for :users, :controllers => {
        :sessions => 'users/sessions',
        :registrations => 'users/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  resources :posts
end
