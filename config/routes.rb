Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'cocktails#index'

  resources :doses, only: [:destroy]
  get 'favorites', to: 'cocktails#favorites', as: :favorites
  get 'my_cocktails', to: 'cocktails#my_cocktails', as: :my

  resources :cocktails, only: [:show, :new, :create, :destroy, :favorites] do
    resources :doses, only: [:create]
    member do
      get 'like_unlike', to: 'cocktails#like_unlike', as: :like_unlike
    end
  end
end
