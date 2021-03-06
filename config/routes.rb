Ovia::Application.routes.draw do  

  root :to => 'categories#index'

  resources :pages, :only => :show
    
  resources :categories do    
    resources :products    
  end
  
    
  resources :projects do
    resources :tickets
  end
  
  resources :tickets  do
    resources :comments
  end
  
  resources :files, :images
  
  get "users/confirmation"

  devise_for :users, :controllers => { :registrations => "registrations" }
  get '/awaiting_confirmation',
    :to => "users#confirmation",
    :as => 'confirm_user'

  
  namespace :admin do    
    root :to => 'base#index'
    resources :pages, :categories, :colors, :sizes,:orders
        
    resources :users do
      resources :permissions
    end
        
    resources :product_options do          
      resources :product_option_variations
    end
    
    resources :products do          
      resources :color_sizes
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
