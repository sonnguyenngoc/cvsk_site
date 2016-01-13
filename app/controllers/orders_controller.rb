class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  include CurrentCart
  before_action :set_cart, only: [:confirm_order, :create]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all.order("created_at DESC")
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # GET /orders/new
  def new
    @order = Order.new
    @order.order_date = Time.now
    @order.order_details.build
    

  end

  # GET /orders/1/edit
  def edit
    @order.order_details.build
    5.times do
      order_detail = @order.order_details.build
    end
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)
    #order[order_date]      order_time
    @order.order_date = (params[:order][:order_date] + " " + params[:order_time]).to_datetime if !params[:order_time].nil? 
    
    respond_to do |format|
      if @order.save
        if !params[:order_time].nil?
          format.html { redirect_to @order, notice: 'Order was successfully created.' }
          format.json { render :show, status: :created, location: @order }
        else
            @order.save_from_cart(@cart)
            #tạo trang cảm ơn
            format.html { redirect_to finish_order_homes_path, notice: '' }
            format.json { render :show, status: :created, location: @order }    
        end
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def confirm_order
    @order = Order.new(order_params)
    #order[order_date]      order_time
    @order.order_date = (params[:order][:order_date] + " " + params[:order_time]).to_datetime
    
    respond_to do |format|
      if @order.save
        
        @cart.line_items.each do |item|
          @order.order_details.create()
        end
        
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:type_id, :customer_name, :customer_email, :customer_phone, :many_people, :order_date, :order_time, :message, order_details_attributes: [:id, :order_id, :product_id, :quantity, :_destroy])
    end
end
