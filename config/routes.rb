Rails.application.routes.draw do

  root             'static_pages#home'
  get 'about'   => 'static_pages#about'
  get 'contact' => 'static_pages#contact'

  get    'signup'  => 'users#new'
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
  resources :users, except: [:destroy]

  namespace :admin do
    root      'static_pages#index'
    resources :users,        only:   [:index, :destroy]
    resources :categories,   except: [:show]
    resources :vocabularies, except: [:show]
  end
  
end
