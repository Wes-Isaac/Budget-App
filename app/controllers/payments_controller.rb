class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def new
    @group = Group.find(params[:group_id])
    @payment = Payment.new
  end


  def create
    group = Group.find(params[:group_id])
    payment = group.payments.create(payment_params)
    respond_to do |format|
      format.html do
        if payment.save
          flash[:success] = 'New Payment Added Succesfully!'
          redirect_to group_path(group)
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
    params.require(:data).permit(:name, :amount)
  end
end
