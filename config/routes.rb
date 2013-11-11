Hogwarts::Application.routes.draw do
  # screwing up unit tests, deal with in a bit
  # route to: 'welcome/index'

  get 'houses'     => 'houses#index'
  get 'houses/:id' => 'houses#show'

  get  'students' => 'students#index'
  get 'students/:id' => 'students#show'
  post 'students' => 'students#create'
  get  'students/new' => 'students#new'

end