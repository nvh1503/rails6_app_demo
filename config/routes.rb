Rails.application.routes.draw do

  mount GrapeSwaggerRails::Engine => '/swagger'
  mount Exam::Root => '/'
  
  get 'home/index'
  root 'home#index'


  devise_for :users
  resources :tests

  scope 'admin', module: :admin, as: :admin do
    resources :users

  end
  
end
