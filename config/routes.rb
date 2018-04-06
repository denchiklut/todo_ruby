Rails.application.routes.draw do

  resources :projects do
    resources :todos do
      member do
        patch :complete
      end
    end
  end

  root "projects#index"
end
