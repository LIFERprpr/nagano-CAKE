Rails.application.routes.draw do
  
  namespace :admins do
    get 'homes/top'
  end
  namespace :admins do
    root 'homes#top'
  end
  
  devise_for :admins, controllers: {
    sessions:       'admins/sessions',
    passwords:      'admins/passwords',
    registrations:  'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:       'customers/sessions',
    passwords:      'customers/passwords',
    registrations:  'customers/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
