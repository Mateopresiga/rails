Rails.application.routes.draw do
  devise_for :user_apis
  resources :challenges
  get 'welcome/index'
  get 'profile', to: 'users#edit'
  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
  get 'search', to: 'articles#search'
  get 'like_article', to: 'articles#like'
  root 'welcome#index'
  get 'weather', to: 'weather#index'
  get 'weather_search', to: 'weather#weather_search'
  resources :users
  resources :articles do
    resources :comments
  end

  resources :courses do
    resources :topics do
      resources :challenges do
        get 'challenge_submit', to: 'challenges#challenge_submit'
      end
    end 
  end

  namespace :api do
    namespace :v1 do
      resources :articles do 
        resources :comments, only: [:create, :index]
      end 
      resources :users
      post "/auth/login", to: "authentication#login"
      resources :courses
    end
  end

end
