Rails.application.routes.draw do

  scope module: :public do
    root :to => "homes#top"
    get '/about' => "homes#about"
    resources :items, only: [:index, :show]

    devise_for :customers, skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
    }

    resource :customers, only: [:show] do
      collection do
        get 'information/edit' => 'customers#edit'
        patch 'information' => 'customers#update'
        get 'check'
        patch 'leave'
      end
    end
    resources :cart_items, only: [:index, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        get 'confirm'
        get 'complete'
      end
    end
    resources :addresses, except: [:new, :show]
  end

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
    sesions: "admin/sessions"
  }

  namespace :admin do
    get '/' => 'homes#top'
    patch 'orders/:order_id/order_details/:id' => "order_details#update"
    resources :items, except: [:destroy]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
  end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
