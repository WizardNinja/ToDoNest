ToDoNest::Application.routes.draw do
  root to: 'to_do_nest#index'
  resources :to_do_nest
end
