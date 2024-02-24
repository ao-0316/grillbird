Rails.application.routes.draw do

root to: "public/homes#top"

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: "public/sessions"
  }


  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  namespace :admin do
    get 'homes/top'
    get 'homes/about'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :yakitoris, only: [:index, :new, :create, :show, :edit, :update]
    resources :yakitori_comments, only: [:index, :destroy]
  end


  namespace :public do
    get "search" => "searches#search"
    get '/genre/search' => 'searches#genre_search'
    get 'homes/top'
    get 'homes/about'
    resources :rooms, only: [:create,:show]
    resources :messages, only: [:create]

    resources :yakitoris, only: [:index, :show,] do
    resource :favorite, only: [:create, :destroy]
    resources :yakitori_comments, only: [:create, :destroy]
    
  end
    get 'customers/:id/favorites', to: 'customers#favorites', as: 'customers_favorites'
    get "customers/:id/mypage", to: "customers#show"
    get "customers/information/edit", to: "customers#edit"
    patch "customers/information", to: "customers#update"
    get 'customers/unsubscribe', to: "customers#unsubscribe"
    patch 'customers/withdraw', to: "customers#withdraw"
  end

  devise_scope :customer do
    post "customers/guest_sign_in", to: "public/sessions#guest_sign_in"
  end

  





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
