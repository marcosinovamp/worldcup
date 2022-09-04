Rails.application.routes.draw do
  root to: 'admin#home'
  get 'classificacao', to: 'admin#classificacao'
  get 'jogos', to: 'admin#tabela'
  get 'resultado/:id', to: 'admin#resultado'
  get 'registro/:id', to: 'admin#registro'
  get 'admin/estatisticas'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
