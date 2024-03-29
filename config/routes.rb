ChessCamp::Application.routes.draw do
  # generated routes
  resources :curriculums
  resources :instructors
  resources :camps
  resources :families
  resources :locations
  resources :students
  resources :users
  resources :registrations

  # semi-static routes
  get 'home', to: 'home#index', as: :home
  get 'home/about', to: 'home#about', as: :about
  get 'home/contact', to: 'home#contact', as: :contact
  get 'home/privacy', to: 'home#privacy', as: :privacy
  get 'home/search' => 'home#search', :as => :search

  # set the root url
  root to: 'home#index'

  resources :sessions

  # PDF 
  get 'report/payment/:id', to: 'report#show_camp', :as => 'payment_pdf'
  get 'report/family/:id', to: 'report#show_family', :as => 'family_pdf'

  get 'user/edit' => 'users#edit', :as => :edit_current_user
  get 'signup' => 'users#new', :as => :signup
  get 'login' => 'sessions#new', :as => :login
  get 'logout' => 'sessions#destroy', :as => :logout
end
