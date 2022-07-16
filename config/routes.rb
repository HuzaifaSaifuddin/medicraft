Rails.application.routes.draw do
  root to: redirect('/appointments')

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  get :signup, to: 'organisations#new'

  resources :appointments do
    collection do
      get :list
    end
  end

  resources :facilities do
    member do
      get :users
    end
  end

  resources :organisations

  resources :patients do
    collection do
      get :search
      put :search_result
    end
  end

  resources :settings

  resources :users
end
