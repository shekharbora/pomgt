class HomeController < ApplicationController
  include Pagy::Backend

  def index
   # # @posts = Post.all.order(id: :desc)
   #  @pagy, @posts = pagy(Post.order(id: :desc))
    @pending_po = PurchaseOrder.pending_po.count
    @total_po =  PurchaseOrder.count
    @approved_po = PurchaseOrder.approved_po.count
  end
end
