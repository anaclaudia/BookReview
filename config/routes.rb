Rails.application.routes.draw do
  get 'categories/new'

  get 'categories/create'

  get 'categories/edit'

  get 'categories/update'

  get 'categories/destroy'

  root 'books#index'
  devise_for :users
	resources :books do
		resources :reviews
	end
end
