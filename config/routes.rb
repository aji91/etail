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
      get :change_status
      get :show_batch_records
      get :filter_batch_records
      get :export_csv
      post :change_record_status
      post :change_multiple_records
    end
  end
end
