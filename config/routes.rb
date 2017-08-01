Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'site/welcome'

  root to: 'site#welcome'
  resources :users do
    post :send_pdf, on: :member
  end
  devise_scope :user do
    get '/sign_up', to: 'registrations#new'
    post '/sign_up', to: 'registrations#create'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
