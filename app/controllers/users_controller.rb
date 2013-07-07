class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:edit, :update]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])  	
  end

  def create
    @user = User.new(params[:user])  	

    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id]) 
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      # Handle a success update
    else
      render 'edit'
    end
  end

  private
    def signed_in_user
      redirect_to signin_path, notice: "Please sign in" unless signed_in?
    end
end
