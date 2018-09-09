Rails.application.routes.draw do

  get 'completados/create'
  get 'tarea/index'
  resources :tareas do
    resources :completados, only: [:create, :update, :show]
  end
  resources :completados, only: :index
  root to: 'tareas#index'
  devise_for :usuarios
end
