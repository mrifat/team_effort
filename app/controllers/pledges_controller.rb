class PledgesController < ApplicationController
  before_action :set_pledges, only: [:show, :new, :edit, :update, :destroy, :create]

  def show
    respond_to do |format|
      format.html
    end
  end

  def index
    @pledges = Effort.all
    respond_to do |format|
      format.html
    end
  end

  def create
    @pledge = @user.pledges.create(pledge_params)
    respond_to do |format|
      if @pledge.valid?
        format.html { redirect_to user_pledge_path(@user, @pledge)}
      else
        format.html { redirect_to user_pledges_path(@user)}
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
      if @pledge.update_attributes(pledge_params)
        format.html { redirect_to user_pledge_path(@pledge), notice: 'Effort was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pledge.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    if @pledge.destroy
      redirect_to user_pledges_path(@user, @pledge)
    else
      redirect_to user_pledge_path(@user, @pledge)
    end
  end
  private
  # below this line thar be dragons

  def pledge_params
    params.require(:user).permit(:name, :created_by, :user_id)
  end

  def set_pledge
    @user = current_user
    @pledge = @user.pledges.where(id: params[:id]).first
  end
end
