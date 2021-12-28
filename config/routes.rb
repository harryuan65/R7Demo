Rails.application.routes.draw do
  resources :addresses do
    collection do
      get :states
    end
  end
  resources :tweets do
    resources :likes
  end
  resources :posts do
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
