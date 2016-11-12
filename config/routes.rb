Rails.application.routes.draw do
	root to: 'products#index'
	resources :products do
		collection do
			get 'fruit', defaults: {format: :json}
			get 'car', defaults: {format: :json}
		end
	end
end
