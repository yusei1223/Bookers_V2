class UsersController < ApplicationController
   before_action :authenticate_user!

  def index
    @users =User.all
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books.all
    @userc = current_user
  end

  def edit
    @user = User.find(params[:id])
    if @user.id != current_user.id 
    redirect_to user_path(current_user)
    end
  end

  def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path(@user.id)
			flash[:success] = "You have updated user successfully."
		else
			render "edit"
		end

  end

  private
	 def user_params
		params.require(:user).permit(:name, :profile_image, :introduction)
	 end
end