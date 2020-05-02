class Admin::UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.order(:created_at).page params[:page]
    respond_with(@users)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User was successfully created.'
      return redirect_to admin_user_path(@user)
    else
      respond_with(@user)
    end
  end

  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = 'User was successfully updated.'
      return redirect_to admin_user_path(@user)
    else
      respond_with(@user)
    end
  end

  def destroy
    if @user.destroy
      flash[:notice] = 'The user was successfully deleted.'
      return redirect_to admin_users_path
    else
      respond_with(@user)
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(
        :name, 
        :username,
        :email,
        :user_type,
        :password,
        :password_confirmation
      )
    end
end
