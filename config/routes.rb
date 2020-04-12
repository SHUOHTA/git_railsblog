Rails.application.routes.draw do
  devise_for :users
  resources :blogs
  root  'blogs#index'                       #ルートパスの指定
end
