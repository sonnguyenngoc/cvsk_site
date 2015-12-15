class MenuContentsController < ApplicationController
  before_action :set_menu_content, only: [:show, :edit, :update, :destroy]

  # GET /menu_contents
  # GET /menu_contents.json
  def index
    @menu_contents = MenuContent.all
  end

  # GET /menu_contents/1
  # GET /menu_contents/1.json
  def show
  end

  # GET /menu_contents/new
  def new
    @menu_content = MenuContent.new
    @menu_content.listing_menu_products.build
    4.times do
      listing_menu_product = @menu_content.listing_menu_products.build
    end
  end

  # GET /menu_contents/1/edit
  def edit
  end

  # POST /menu_contents
  # POST /menu_contents.json
  def create
    @menu_content = MenuContent.new(menu_content_params)

    respond_to do |format|
      if @menu_content.save
        format.html { redirect_to @menu_content, notice: 'Menu content was successfully created.' }
        format.json { render :show, status: :created, location: @menu_content }
      else
        format.html { render :new }
        format.json { render json: @menu_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /menu_contents/1
  # PATCH/PUT /menu_contents/1.json
  def update
    respond_to do |format|
      if @menu_content.update(menu_content_params)
        format.html { redirect_to @menu_content, notice: 'Menu content was successfully updated.' }
        format.json { render :show, status: :ok, location: @menu_content }
      else
        format.html { render :edit }
        format.json { render json: @menu_content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /menu_contents/1
  # DELETE /menu_contents/1.json
  def destroy
    @menu_content.destroy
    respond_to do |format|
      format.html { redirect_to menu_contents_url, notice: 'Menu content was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_menu_content
      @menu_content = MenuContent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def menu_content_params
      params.require(:menu_content).permit(:title, :content, listing_menu_products_attributes: [:id, :menu_content_id, :product_id, :_destroy])
    end
end
