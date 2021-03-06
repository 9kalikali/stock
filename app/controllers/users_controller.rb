class UsersController < ApplicationController
  before_action :admin_user, only: [:index,:show]
  #before_action :correct_user,   only: [:show, :edit, :update]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to '/mainpage'
    else
      redirect_to '/signup'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
  #def correct_user
   # @user = User.find(params[:id])
    #redirect_to(root_url) unless @user == current_user  
  #end

  def admin_user
    redirect_to(login_url) unless (logged_in?) && (current_user.admin?)
  end
end
