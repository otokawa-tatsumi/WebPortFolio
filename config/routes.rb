Rails.application.routes.draw do
  devise_for :users
  get "home" => "home#index"
  get "contact" => "contact#index"
  get "contact/confirm" => "contact#index"
  get "contact/thanks" => "contact#thanks"
  get "admin" => "admin#index"
  get "admin/delete/:id" => "admin#destroy"
  delete "admin/delete/:id" => "admin#destroy"
  get "admin/search" => "admin#search"
  post "admin/open" => "admin#open"
  root to: "home#index"

  resources :contact, only: [:index, :create, :thanks] do
    collection do
      post :confirm
    end
  end

end
