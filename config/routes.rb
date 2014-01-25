WorldClass::Application.routes.draw do

  resources :classrooms do
    resources :questions do
      resources :answers
    end
  end

  devise_for :users


  root :to => "static#index"

end
