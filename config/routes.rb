Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# this two lines below will nest review inside restaurants: check routes!!

resources :restaurants, only: [:index, :new, :show, :create] do
  resources :reviews, only: [:new, :create]
  end
end
