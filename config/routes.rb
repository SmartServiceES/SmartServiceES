Rails.application.routes.draw do
  resources :enderecos
  resources :clientes
  get 'home/index'
  root 'home#index'

  resources :trabalhadors
  resources :servicos
  resources :contratos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
