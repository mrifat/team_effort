class EffortsController < ApplicationController
  before_action :set_efforts, only: [:show, :new, :edit, :update, :destroy, :create]

  def show
    respond_to do |format|
      format.html
    end
  end

  def create
    @effort = @user.efforts.create(effort_params)
    respond_to do |format|
      if @effort.valid?
        format.html { redirect_to user_effort_path(@user, @effort)}
      else
        format.html { redirect_to user_efforts_path(@user)}
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
      if @effort.update_attributes(effort_params)
        format.html { redirect_to user_effort_path(@effort), notice: 'Effort was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @effort.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @effort.destroy
      redirect_to user_efforts_path(@user, @effort)
    else
      redirect_to user_effort_path(@user, @effort)
    end
  end
  private
  # below this line thar be dragons

  def effort_params
    params.require(:user).permit(:name, :created_by, :user_id)
  end

  def set_effort
    @user = current_user
    @effort = @user.efforts.where(id: params[:id])
  end
end
