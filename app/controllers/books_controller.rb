class BooksController < ApplicationController
  def create
    book = Book.new(book_params)
    book.save
    redirect_to  book_path(book.id)
  end

  def index
    @books = Book.all
    @book = Book.new
    @books = Book.all.order(created_at: :asc)
    
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)  
  end
  
  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
