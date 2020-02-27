Rails.application.routes.draw do
  scope :api, defaults: { format: :json } do
    resources :stories, only: :index
  end
end
