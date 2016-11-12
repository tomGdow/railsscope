Rails.application.routes.draw do
	resources :products do
		collection do
			get 'fruit', defaults: {format: :json}
			get 'car', defaults: {format: :json}
		end
	end
end
