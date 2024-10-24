class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "Your post has been successfully submitted."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    # @books = Book.all.order(created_at: :asc)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  # def update
  #   book = Book.find(params[:id])
  #   book.update(book_params)
  #   redirect_to book_path(book.id)
  # end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Your edit has been successfully completed."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end


  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Your deletion has been successfully completed."
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
