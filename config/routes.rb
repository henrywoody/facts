Rails.application.routes.draw do
  resources :join_topic_facts_pages
  resources :join_item_topics
  resources :items
  resources :facts_pages
  resources :topics
  resources :users, controller: :users, only: :create

  #root 'facts_pages#index'

  constraints Clearance::Constraints::SignedOut.new do
    root to: "front#show"
  end

  constraints Clearance::Constraints::SignedIn.new do
    root to: "facts_pages#index", as: :signed_in_root
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
