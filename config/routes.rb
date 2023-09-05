Rails.application.routes.draw do
  resources :calls do
    member do
      get "preview"
    end

    collection do
      get 'search'
    end
  end  
  resources :clients do
    member do
      get "preview"
    end

    collection do
      get 'search'
    end
  end

  devise_for :users, skip: :registrations, controllers: {
    sessions: 'users/sessions'
  }
  
  get 'homes/index'
  get '/users/sign_up', to: redirect('/users/sign_in')

  devise_scope :user do
    root to: "homes#index"
  end
end
