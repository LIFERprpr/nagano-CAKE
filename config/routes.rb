Rails.application.routes.draw do
  
  namespace :admins do
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    
    
    get 'homes/top'
  end
  # adminsフォルダのhomes#topをルートに指定し、URLを/adminに変更
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
