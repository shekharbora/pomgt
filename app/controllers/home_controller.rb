class HomeController < ApplicationController
  include Pagy::Backend

  def index
   # # @posts = Post.all.order(id: :desc)
   #  @pagy, @posts = pagy(Post.order(id: :desc))
    @purchase_orders = PurchaseOrder.last 10
    @pending_po = PurchaseOrder.pending_po.count
    @total_po =  PurchaseOrder.count
    @approved_po = PurchaseOrder.approved_po.count
    @cancel_po = PurchaseOrder.canceled_po.count
    @chart = {
       pending: @pending_po,
       rejected: @cancel_po,
       approved: @approved_po 
    }
    @payment_requisition = nil
    @approval_request = ApprovalRequest.where(approver_id: current_user.id)
    @approval_request_count = @approval_request.count
  end
end
