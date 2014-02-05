WorldClass::Application.routes.draw do

  resources :classrooms do
    member { get :notify }
    resources :questions do
      member { post :vote }
      resources :answers do
        member { post :vote }
      end
    end
  end

  post "/control_player", to: "classrooms#control_player"
  post "/push", to: "classrooms#notify"

  devise_for :users


  root :to => "static#index"

end
