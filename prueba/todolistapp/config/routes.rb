Rails.application.routes.draw do

  get 'completados/create'
  resources :tareas, only: :index do
    resources :completados, only: :create
  end
  
  root to: 'tareas#index'
  devise_for :usuarios
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
