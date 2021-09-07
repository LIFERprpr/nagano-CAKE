Rails.application.routes.draw do

  namespace :admins do
    resources :items, except: [:destroy]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]


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


  root to: 'homes#top'
  get '/about' => 'homes#about'
  
  scope module: :public do
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get :check
        patch :withdraw
      end
    end
  end
  
  devise_for :customers, controllers: {
    sessions:       'customers/sessions',
    passwords:      'customers/passwords',
    registrations:  'customers/registrations'
  }


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
