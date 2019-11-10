class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :show]

  def index
    @users =  User.paginate(page: params[:page], per_page: 5)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    puts @user.errors
    if @user.save
      flash[:success]= "Sign Up Successfully! Welcome #{@user.username}"
      redirect_to profiles_path
    else
      render 'new'
    end
  end

  def edit
  end

  def show
    @user_profiles = @user.profiles.paginate(page:params[:page], per_page: 5)
  end

  def update
    if @user.update(user_params)
      flash[:success] = "User details were updated"
      redirect_to profiles_path
    else
      render 'edit'
    end
  end
  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
  