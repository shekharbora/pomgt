class PurchaseOrdersController < ApplicationController
  before_action :set_purchase_order, only: %i[ show edit update destroy download]

  # GET /purchase_orders or /purchase_orders.json
  def index
    @purchase_orders = PurchaseOrder.all#current_user.purchase_orders
  end

  # GET /purchase_orders/1 or /purchase_orders/1.json
  def show
  end

  # GET /purchase_orders/new
  def new
    @purchase_order = PurchaseOrder.new
    @purchase_order.purchase_order_items.build
  end

  # GET /purchase_orders/1/edit
  def edit
  end

  # POST /purchase_orders or /purchase_orders.json
  def create
    @purchase_order = current_user.purchase_orders.new(purchase_order_params)

    respond_to do |format|
      if @purchase_order.save
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully created." }
        format.json { render :show, status: :created, location: @purchase_order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /purchase_orders/1 or /purchase_orders/1.json
  def update
    respond_to do |format|
      if @purchase_order.update(purchase_order_params)
        format.html { redirect_to purchase_order_url(@purchase_order), notice: "Purchase order was successfully updated." }
        format.json { render :show, status: :ok, location: @purchase_order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_orders/1 or /purchase_orders/1.json
  def destroy
    @purchase_order.destroy!

    respond_to do |format|
      format.html { redirect_to purchase_orders_url, notice: "Purchase order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # download PDF
  def download
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "file_name"#, template: "purchase_orders/purchase_order.pdf.erb", formats: [:html]

      end  
    end 
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_purchase_order
      @purchase_order = PurchaseOrder.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def purchase_order_params
      params.require(:purchase_order).permit(:po_number, :gst_no, :payment_terms, :contact_person, :site_address, :billing_address, :vender_detail, :department_id, :project_id, :gst_per,:comment, purchase_order_items_attributes: [:id,:item_desctiption,:hsn_code,:qty, :unit, :basic_price, :_destroy])
    end
end



