class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:id])
    @payment = Payment.new
  end

  def create
    @group = Group.find_by(name: payment_params[:category])
    payment = @group.payments.new(name: payment_params[:name], amount: payment_params[:amount],
                                  user_id: current_user.id, group_id: @group.id)
    respond_to do |format|
      format.html do
        if payment.save
          flash[:success] = 'New Payment Added Succesfully!'
          redirect_to group_path(@group.id)
        else
          render :new, alert: 'Error occured!'
        end
      end
    end
  end

  def destroy
    payment = Payment.find(params[:id])
    payment.destroy
    redirect_to root_path
    flash[:success] = 'Payment Deleted'
  end

  private

  def payment_params
    params.require(:data).permit(:name, :amount, :category)
  end
end
