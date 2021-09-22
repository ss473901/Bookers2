Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get 'about' => 'homes#about'
  post 'books' => 'books#create'
  resources :books
  resources :users
 

end