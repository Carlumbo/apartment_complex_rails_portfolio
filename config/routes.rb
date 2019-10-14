Rails.application.routes.draw do


  get 'landlords/:id/larger_than_4_tenants', :to => 'landlords#larger_than_4_tenants', :as => :larger_than_4_tenants
  get '/landlords/index', :to => 'landlords#index', :as => :index
  post 'landlords/:id/apartments/new', :to => 'apartments#create'

  resources :landlords do
  	resources :apartments do 
  	  resources :floor_plans, only: [:larger_than_4_tenants]
    end
  end
  resources :tenants
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  root 'homepage#index'

end
