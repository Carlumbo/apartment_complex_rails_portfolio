Rails.application.routes.draw do
  get 'floor_plans/index'
  get 'floor_plans/show'
  get 'tenants/index'
  get 'tenants/show'
  get 'tenants/edit'
  get 'tenants/new'
  get 'tenants/_form'

  get 'landlords/about'
  get 'landlords/index'
  get 'landlords/show'

  root 'apartments#home'

  get 'apartments/about'
  get 'apartments/home'
  get 'apartments/contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
