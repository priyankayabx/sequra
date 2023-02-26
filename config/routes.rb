require 'resque/server'
require 'resque/scheduler/server'
Rails.application.routes.draw do
  mount Resque::Server.new, at: "/resque"
  resources :orders
  resources :merchants
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
