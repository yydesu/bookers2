class UsersController < ApplicationController

  def index
    @users = User.all
    @books = Book.all
    @user = current_user
    @book = Book.new

  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
       flash[:notice] = 'successfully'
       redirect_to book_path(@book)
    else
       flash.now[:alert] = 'eroor'
       render :index
    end
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
    @books = @user.books.reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'successfully'
      redirect_to user_path(@user.id)
    else
      flash.now[:alert] = 'error'
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
