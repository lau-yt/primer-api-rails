Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  	#ruta para listar todos los libros 
	#get "books" => "books#index" 
	#mostrar un libro 
	#get "books/:id" => "bookss#show"
	#o bien
	#resources :books
	# otra manera 
	# routes.rb
  	resources :books, except: [:new, :edit] 
end

