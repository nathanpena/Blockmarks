Rails.application.routes.draw do
  resources :topics

  get 'bookmark/index'

  devise_for :users
  get 'welcome/index'

  get 'welcome/about'

  root to: 'welcome#index'
  post :incoming, to: 'incoming#create'
end
