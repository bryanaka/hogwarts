Hogwarts::Application.routes.draw do
  # screwing up unit tests, deal with in a bit
  # route to: 'welcome/index'

  get '/houses'   => 'houses#index'
  get '/students' => 'students#index'
  get '/students' => 'students#creat'
end