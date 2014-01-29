WorldClass::Application.routes.draw do

  resources :classrooms do
    resources :questions do
      member { post :vote }
      resources :answers do
        member { post :vote }
      end
    end
  end

  devise_for :users


  root :to => "static#index"

end
