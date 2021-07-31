
Rails.application.routes.draw do
    # if Rails.env.development?
    #   mount LetterOpenerWeb::Engine, at: "/letter_opener"
    # end

  get 'users/show'
  root to:"books#index"
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  resources :books
  resources :users, only: [:index, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end

