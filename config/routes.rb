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
    # TIPS: ユーザー登録失敗のリダイレクトのエラーを防ぐ https://github.com/heartcombo/devise/blob/master/app/controllers/devise/registrations_controller.rb
    get '/users', to: 'devise/registrations#new'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  resources :users do
    resource :relationships, only: [:create, :destroy]
  end
  resources :posts
end