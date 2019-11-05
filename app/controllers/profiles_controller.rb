class ProfilesController < ApplicationController
  before_action :set_profile, only: [:edit, :update, :show, :destroy]

  def index
    @profiles = Profile.all
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    puts @profile.errors
    if @profile.save
      flash[:notice]= "Profile was saved"
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
      flash[:notice] = "Article was updated"
      redirect_to profile_path(@profile)
    else
      render 'edit'
    end
  end

  def destroy
    @profile.destroy
    flash[:notice] = "Profile was deleted"
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
