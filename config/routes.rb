Rails.application.routes.draw do
  devise_for :users ,:controllers => {
  	confirmations: 'users/confirmations',
  	passwords: 'users/passwords',
  	registrations: "users/registrations",
  	sessions: 'users/sessions'
  }
  root 'dashboards#index'
  resources :dashboards, only: [:index] do
    collection do
      match :create_new_user, via: [:get, :post]
      get :create_new_batch
    end
  end

  resources :batches do
    collection do
      match :upload_file, via: [:get, :post]
    end
  end
end
