Rails.application.routes.draw do
  devise_for :users
  root 'memos#index'
  resources :memos, only: [:index, :show, :new, :create, :destroy, :edit, :update]
end
