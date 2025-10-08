Rails.application.routes.draw do
  # Rotas protegidas
  resources :lancamentos
  resources :tipos_usuarios
  resources :categorias
  resources :setores
  resources :users, only: [:index, :show, :update, :destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Rotas de autenticação
  post "signup", to: "users#create"    # cadastro
  post "login", to: "authentication#login"  # login

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
