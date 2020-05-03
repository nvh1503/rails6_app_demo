Rails.application.routes.draw do

  mount GrapeSwaggerRails::Engine => '/swagger' unless Rails.env.production?
  
  # mount Root => '/'
  mount Exam::Root => '/'
  
  get 'home/index'
  root 'home#index'

  # devise_for :users, only: [
  #                       :confirmations,
  #                       :sessions,
  #                       :registrations,
  #                       :passwords,
  #                       :omniauth_callbacks
  #                     ]

  devise_for :users
  resources :tests
  # resources :options
  # resources :questions

  scope '/admin' do
  end

  scope 'admin', module: :admin, as: :admin do
    resources :users

  end
  
end
