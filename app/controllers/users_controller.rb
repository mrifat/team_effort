class UsersController < ApplicationController
  before_action :set_user, only: [:show, :new, :edit, :update, :destroy]

  def show
    respond_to do |format|
      format.html
    end
  end

  def create
    @user = User.create(user_params)
    respond_to do |format|
      if @user.valid?
        format.html { redirect_to user_path(@user)}
      else
        format.html { redirect_to user_registration_path}
      end
    end
  end

  def edit
    respond_to do |format|
      format.html
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params)
        format.html { redirect_to user_path, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @user.destroy
      redirect_to '/'
    else
      redirect_to user_path(@user)
    end
  end
  private
  # below this line thar be dragons

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
