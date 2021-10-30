Rails.application.routes.draw do
  root 'static_page#index'
  devise_for :users, controllers: { registrations: "users/registrations"}
  resources :advertisements
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 3 parts!
  get 'hello_link', to: ->(req) {[200, {},['Hi, everyone!']]}

  # 4 parts:
  # get 'advertisements', controller: 'advertisements', action: 'index'
  # get 'advertisements/new', controller: 'advertisements', action: 'new'
end
 