class OrdersController < ApplicationController
  before_action :set_order, only: %i[ show edit update destroy ]

  # GET /orders or /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1 or /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders or /orders.json
  def create
    @order = Order.new(order_params)
    emails = params[:order].slice(:sender_email, :receiver_email, :currior_number)
    
    respond_to do |format|
      if @order.save
        emails = emails.merge(currior_number: @order.curior_number)
        
        Order.send_order_create_email(emails)
        format.html { redirect_to @order, notice: "Order was successfully created." }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1 or /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: "Order was successfully updated." }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1 or /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: "Order was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def search_order
    currior_number = params[:currior_number]
    if currior_number
      code = currior_number.split('-')[0]
      str = currior_number.split('-')[1]
      if code == "CUR" && str.length == 8
          @order = Order.search(currior_number)
      else
        flash.now[:notice] = "Invalid Track id"
        render :search_order
      end
    end
  end

  private

    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_params
      params.require(:order).permit(:sender_name, :sender_email, :sender_address, :sender_mobile, :sender_pincode, :receiver_name, :receiver_email, :receiver_address, :receiver_mobile, :receiver_pincode, :weight, :type_of_service, :cost_of_service, :payment_mode, :assm_state, :curior_number)
    end
end
