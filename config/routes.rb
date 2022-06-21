Rails.application.routes.draw do
  root 'appointments#index'

  get :login, to: 'sessions#new'
  post :login, to: 'sessions#create'
  delete :logout, to: 'sessions#destroy'

  get :signup, to: 'organisations#new'

  resources :appointments
  resources :patients do
    collection do
      get :search
      put :search_result
    end
  end
  resources :organisations
end
