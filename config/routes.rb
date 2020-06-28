Rails.application.routes.draw do

  
  scope module: 'authors' do
    resources :posts do
      resources :elements
      

      # member routes act on single object but collection does not
      member do
        get :publish # member routes generate URL like /posts/:post_id/publish
        get :unpublish # member routes generate URL like /posts/:post_id/unpublish
      end
      
      # collection do
      #   get :publish # member routes generate URL like /posts/publish
      #   get :unpublish # member routes generate URL like /posts/unpublish
      # end

    end
  end	
  
  devise_for :authors
  devise_for :users
  get 'home/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "home#index"
end
