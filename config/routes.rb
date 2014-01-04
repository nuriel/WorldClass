WorldClass::Application.routes.draw do

  resources :classrooms


  resources :answers


  resources :questions


  devise_for :users

  root :to => "home#index"

end
