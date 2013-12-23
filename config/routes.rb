FacSite::Application.routes.draw do

  scope module: :web do
    namespace :admin do
      resources :news
      resources :categories
      resources :documents
      resource :faculties

      root to: "welcome#index"
    end

    root to: "welcome#index"
  end

end
