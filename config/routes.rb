Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'groups#index'
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:new, :create, :edit, :update] do
    resources :posts, only: [:index ,:create]

    namespace :api do
      resources :posts, only: :index, defaults: { format: 'json' }
    end
  end
  post "likes/:post_id/create" => "likes#create"
end
