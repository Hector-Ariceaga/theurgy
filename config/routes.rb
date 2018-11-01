Rails.application.routes.draw do
  COMMON_ROUTES = [:index, :new, :create, :show, :destroy]
  
  root 'welcome#home'

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  delete '/signout', to: 'sessions#destroy'
  get '/auth/facebook/callback', to: 'sessions#create_facebook'

  resources :users, only: [:new, :create, :show] do
    resources :patients
  end
  
  resources :symptoms, only: COMMON_ROUTES 
  resources :diagnoses, only: COMMON_ROUTES 
  resources :treatments
  resources :therapies, only: [:create, :edit, :update, :destroy]
end
