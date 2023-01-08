class BooksController < ApplicationController
  def new
    @list = Book.new
  end

  def create
    @list_create = Book.new(list_params)
    @list = Book.all
    


    if @list_create.save
      flash[:notice] = "Book was successfully created"
      redirect_to book_path(@list_create.id)

    else
      render :index
    end

  end

  def index
    @list = Book.all
    @list_new = Book.new
    @list_create = Book.new(params[:id])
  end

  def show
    @list = Book.find(params[:id])
  end

  def edit
    @list = Book.find(params[:id])
  end

  def update
    @list = Book.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Book was successfully edited"
      redirect_to book_path(@list.id)
    else
      render :edit
    end
    
  end

  def destroy
    list = Book.find(params[:id])
    list.destroy
    flash[:notice] = "Book was successfully deleted"
    redirect_to books_path
  end

  private
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
