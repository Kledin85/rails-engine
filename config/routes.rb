Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      resources :merchants, only: [:index, :show] do
        get :find_all, on: :collection
        resources :items, only: :index, controller: 'merchant_items'
      end
      
      resources :items, except: [:new, :edit] do
        get :find, on: :collection
        resources :merchant, only: :index
      end
    end
  end
end
