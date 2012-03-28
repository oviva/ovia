Ovia::Application.routes.draw do
  resources :files
  resources :images
  get "users/confirmation"

  devise_for :users, :controllers => { :registrations => "registrations" }
  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'

  resources :projects do
    resources :tickets
  end
  
  resources :tickets do
    resources :comments
  end
  
  

  root :to => 'projects#index'

  namespace :admin do
    
    root :to => 'base#index'
    
    resources :users do
      resources :permissions
    end
    
    resources :categories do      
    end
    
    resources :products do
    end
        
    resources :states do
      member do
        get :make_default
      end
    end
  end
  
  put '/admin/users/:user_id/permissions',
            :to => 'admin/permissions#update',
            :as => :update_user_permissions
  
end
