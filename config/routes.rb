Hogwarts::Application.routes.draw do
  # screwing up unit tests, deal with in a bit
  # route to: 'welcome/index'

  resources :students

  get '/houses'     => 'houses#index'
  get '/houses/:id' => 'houses#show'

  

end