Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  get 'comments_posts/new'
  get 'comments_posts/create'
  get 'comments_posts/update'
  
  root to: "home#index"

  get "about", to: "home#about"

  resources :posts do
    resources :comments
  end
  
end
