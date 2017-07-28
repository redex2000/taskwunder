Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  get 'site/welcome'

  root to: 'site#welcome'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
