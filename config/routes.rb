Rails.application.routes.draw do
  resources :join_topic_user_pages
  resources :join_item_topics
  resources :items
  resources :user_pages
  resources :topics

  #root 'user_pages#index'
  root 'front#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
