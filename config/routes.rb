Rails.application.routes.draw do
  resources :companies
  resources :projects
  root   'home#index'
  get    '/signup' => 'signup#index'
  post   '/signup' => 'signup#create'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :profiles , only: [:update]
  resources :educations , only: [:new]
end
