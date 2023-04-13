class BooksController < ApplicationController

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      redirect_to '/books'
    else
      render :new
    end
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    redirect_to '/books'
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end



  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
