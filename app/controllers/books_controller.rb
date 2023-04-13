class BooksController < ApplicationController

  # def new
    # @book = Book.new
  # end

  def edit
    @book = Book.find(params[:id])
  end

  def show
    @book = Book.find(params[:id])
  end

  def index
    @books = Book.all
    @book = Book.new
  end

  def create
    @book = Book.new(book_params)
    if @book.save
      flash[:notice] = "create successfully"
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)
      flash[:notice] = "edit successfully"
      redirect_to book_path(book.id)
    else
      @book = Book.find(params[:id])
      flash[:notice] = "edit error"
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "destroy successfully"
    redirect_to '/books'
  end



  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
