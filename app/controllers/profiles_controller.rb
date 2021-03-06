class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :show, :destroy]

  def index
    @profiles = Profile.paginate(page: params[:page], per_page: 5)
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = User.first
    puts @profile.errors
    if @profile.save
      flash[:success]= "Profile was saved"
      redirect_to profile_path(@profile)
    else
      render 'new'
    end
    
  end

  def show
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      flash[:success] = "Article was updated"
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    flash[:danger] = "Profile was deleted"
    redirect_to profiles_path
  end


  private 
    def set_profile
      @profile = Profile.find(params[:id])
    end
    def profile_params
      params.require(:profile).permit(:title, :description)
    end

end
