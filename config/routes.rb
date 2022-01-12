Rails.application.routes.draw do
  root   'home#index'
  get    '/signup' => 'signup#index'
  post   '/signup' => 'signup#create'
  get    'edit'    => 'home#edit'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  resources :profiles , only: [:update, :show ]
  resources :companies, only: [:new, :edit, :delete]
  resources :project, only: [:new, :edit, :delete]
  resources :educations , only: [:new]
end
