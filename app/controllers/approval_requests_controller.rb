class ApprovalRequestsController < ApplicationController

	def create
	    @purchase_order = PurchaseOrder.find(params[:purchase_order_id])
	    @approval_request = @purchase_order.build_approval_request(status: :pending)
	    
	    if @approval_request.save
	      redirect_to @purchase_order, notice: 'Approval request created successfully.'
	    else
	      redirect_to @purchase_order, alert: 'Failed to create approval request.'
	    end
	  end

	  def update
	    @approval_request = ApprovalRequest.find(params[:id])
	    if @approval_request.update(approval_request_params)
	      redirect_to @approval_request.purchase_order, notice: 'Approval request updated.'
	    else
	      render :edit
	    end
	  end

  private

  def approval_request_params
    params.require(:approval_request).permit(:status)
  end
end
