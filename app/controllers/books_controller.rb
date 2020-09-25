class BooksController < ApplicationController
	before_action :set_book, only: [:show, :update, :destroy]
	#GET /books
	def index
		@books = Book.all	
		render json: @books
	end
	# GET /books/1
	def show
		render json: @book
	end
	# POST /books 
	def create     #form new book 
		@book = Book.new(book_params)
		if @book.save
			render json: { sucess: true, book_id: @book.id}
		else
			render json: { sucess: false }
		end
	end
	#PATCH/PUT /books/1	
	def update
		if @book.update(book_params)
			render json: @book #{ success: true }
		else 
			render json: @book.errors, status: :unprocessable_entity
		end
	end
	#DELETE /books/1
	def destroy
		if @book.destroy
			render json: { success: true}
		else
			render json: { success: false}
		end
	end

	private
		#Use callbacks to share common setup
		def set_book
			@book = Book.find(params[:id])
		end
		# Only allow a trusted parameter "with list" through
		def book_params 
			params.require(:book).permit(:title, :author, :synopsis, :year)
		end
end
