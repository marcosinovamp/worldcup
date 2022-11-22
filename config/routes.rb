Rails.application.routes.draw do
  root to: 'admin#home'
  get 'jogos', to: 'admin#tabela'
  get 'classificacao', to: 'admin#classificacao'
  get 'estatisticas', to: 'admin#estatisticas'
  get 'cgeral', to: 'admin#cgeral'
  get 'artilheiros', to: 'admin#artilheiros'
  get 'hoje', to: 'admin#hoje'
  get 'resultado/:id', to: 'admin#resultado'
  get 'rascunho/:id', to: 'admin#rascunho'
  get 'selecao/:id', to: 'admin#selecao'
  get 'registro/:id', to: 'admin#registro'
  get 'ycards/:id', to: 'admin#ycards'
  get 'rcards/:id', to: 'admin#rcards'
  get 'started/:id', to: 'admin#started'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
