Rails.application.routes.draw do
  # get 'users/index'
  # get 'users/new'
  # get 'users/create'
  # get 'users/edit'
  # get 'users/update'
  # get 'users/destroy'
  get 'home/index'
  root 'home#index'

  devise_for :users, only: [
                        :confirmations,
                        :sessions,
                        :registrations,
                        :passwords,
                        :omniauth_callbacks
                      ]
  resources :tests
  # resources :options
  # resources :questions

  scope '/admin' do
  end

  scope 'admin', module: :admin, as: :admin do
    resources :users

  end
  
end
