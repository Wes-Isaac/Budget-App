class PaymentController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
    @payments = @group.payments
  end

  def new
    @group = Group.new
    @icons = icons
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

  def destroy
    group = Group.find(params[:id])
    group.destroy
    redirect_to groups_path
    flash[:success] = 'Group Deleted!'
  end

  def show
    @group = Group.find(params[:id])
    @payments = @group.payments
  end

  private

  def group_params
    params.require(:data).permit(:name, :icon)
  end
end