Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      patch '/subscriptions', to: 'subscriptions#update'
      resources :subscriptions, only: [:create, :update] 
      resources :customers, only: :show do 
        resources :subscriptions, only: :index 
      end 
    end 
  end 
end
