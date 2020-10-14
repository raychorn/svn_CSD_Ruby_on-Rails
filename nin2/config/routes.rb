Nin::Application.routes.draw do
  require 'domain'

  # Backend Domain Routes
  constraints(BackEndDomain) do
    mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

    authenticated :user do
      root :to => 'home#index'
    end
    root :to => "home#index"
    devise_for :users, :controllers => {:registrations => 'users/registrations'} do
      get "interpreter/sign_up" => "users/registrations#interpreter_sign_up", as: :interpreter_sign_up
      post "interpreter/create_account" => "users/registrations#interpreter_create", as: :interpreter_create_account
      get "users/pick" => "users/registrations#choose_role", as: :user_choose_role
      get "client/sign_up" => "users/registrations#client_sign_up", as: :client_sign_up
      post "client/create_account" => "users/registrations#client_create", as: :client_create_account
    end

    resources :users, :only => [:show, :index]
    resources :interpreters
    match 'available' => 'interpreters#available', :as => :available

    resources :job_requests, :only => [:new, :create, :update] do
      collection do
        post 'interpreters_available'
      end
    end

    resources :job_offers, :only => [] do
      get "accept" => "job_offers#accept", as: :accept, on: :member
    end

    resources :clients do
      post 'create_scheduled_location', :on => :member
    end

    resources :job_requests
    match 'requests' => 'job_requests#index', :as => :requests

    resources :job_assignments

    match 'assignments' => 'job_assignments#index', :as => :assignments

    resources :pricing_block_periods
    match 'blocks' => 'pricing_block_periods#index', :as => :blocks
  end

  # Frontend domain routes
  constraints(FrontEndDomain) do
    get 'pages/:page' => "frontend/pages#static_content", as: :pages
  end
end
