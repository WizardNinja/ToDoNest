ToDoNest::Application.routes.draw do
  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}

  root to: 'main#index'
  match 'api/index_graph', to: 'main#index_graph'
  match 'api/show_graph/:id', to: 'main#show_graph'
  scope "api" do
  	resources :todos
  end
end
