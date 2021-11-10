Rails.application.routes.draw do
  get 'homes/thanks'
  root to: 'posts#index'
  post 'like/:id' => 'likes#create', as: 'create_like'
  delete 'like/:id' => 'likes#destroy', as: 'destroy_like'
  
  devise_for :users, :controllers => {
        :sessions => 'users/sessions',
        :registrations => 'users/registrations',
        :omniauth_callbacks => 'users/omniauth_callbacks'
  }
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users, except: [:index] do
    resource :relationships, only: [:create, :destroy]
  end
  resources :posts
end
