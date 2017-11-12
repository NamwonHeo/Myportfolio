Rails.application.routes.draw do
  resources :specs
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  root 'specs#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
