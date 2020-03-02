Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :stories, only: :index do
      resources :comments, only: :index

      collection do
        get :search
      end
    end
  end
end
