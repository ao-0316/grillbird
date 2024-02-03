Rails.application.routes.draw do

  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sessions: "admin/sessions"
  }

  devise_scope :user do
    post "users/guest_sign_in", to: "users/sessions#guest_sign_in"
  end

  namespace :admin do
    get 'homes/top'
    get 'homes/about'
    resources :customers, only: [:index, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :yakitoris, only: [:index, :new, :create, :show, :edit, :update]
  end


  namespace :public do
    get 'homes/top'
    get 'homes/about'
    resources :customers, only: [:show, :edit, :update,:unsubscribe,:withdraw]
    resources :yakitoris, only: [:index, :show,]
  end



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
