class GroupsController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = current_user.groups
  end

  def create
    group = current_user.groups.new(group_params)
    respond_to do |format|
      format.html do
        if group.save
          flash[:success] = 'Created New Group Succesfully!'
          redirect_to groups_path
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def new
    @group = Group.new
    @icons = { 'Grocery' => 'icon0.png', 'Food' => 'icon1.png', 'Bills' => 'icon2.jpg', 'Housing' => 'icon3.png',
      'Mortgage' => 'icon4.png', 'Shopping' => 'icon5.png' }
  end

  def show
    @group = Group.find(params[:id])
    @payments = @group.payments
  end

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
    flash[:success] = 'Group Deleted!'
  end

  private

  def group_params
    params.require(:data).permit(:name, :icon)
  end
end