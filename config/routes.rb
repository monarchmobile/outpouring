Outpouring::Application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  resources :pages
  resources :products
  resources :contacts
  resources :links
  resources :roles
  resources :profiles
  resources :partials

  match "article_partial", :to => "articles#article_partial"

  # blogs
  resources :articles do
    resources :comments
    collection { post :sort }
  end
  match 'articles/:id/article_status', to: 'articles#article_status', as: 'article_status'
  match "articles/:id/article_starts_at", to: "articles#article_starts_at", as: "article_starts_at"
  match "articles/:id/article_ends_at", to: "articles#article_ends_at", as: "article_ends_at"

  # pages
  resources :pages do
    collection { post :sort }
  end
  match 'pages/:id/status', to: 'pages#status', as: 'status'

  # supermodels
  resources :supermodels do
    collection { post :sort }
  end
  match "supermodels/:id/model_status", :to => "supermodels#model_status", :as => "model_status"

  

  devise_for :users, path_names: {sign_in: "login", sign_out: "logout"}, :controllers => { :registrations => "users/registrations" }
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
  mount Piggybak::Engine => '/checkout', :as => 'piggybak'

  match 'dashboard', :to => 'static_pages#dashboard'
  match 'article_index', :to => 'articles#article_index'
  # match "users/:id/update", to: "users#update"

  
  root :to => "pages#show", :id => 'home'


end
