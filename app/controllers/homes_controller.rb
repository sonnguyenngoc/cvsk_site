class HomesController < ApplicationController
  before_action :set_home, only: [:show, :edit, :update, :destroy]
  layout "layout_frontend"
  
  # GET /homes
  # GET /homes.json
  def index
    @class_body = 'home'
    @module_slide_products = Product.joins(:manufacturer).where(manufacturers: { name: 'Chay vì sức khỏe' }).order("created_at DESC").first(8)
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
    @module_news_posts = Post.joins(:tag).where(tags: { title: 'Tin tức', title: 'Dịch vụ' }).order("created_at DESC").first(2)
    @module_news_events = Post.joins(:tag).where(tags: { title: 'Sự kiện' }).order("created_at DESC").first(1)
    @module_hour_restaurant = Post.joins(:tag).where(tags: { title: 'Giờ mở cửa' }).order("created_at DESC").first(1)
    @slide_shows = SlideShow.all
  end

  # GET /homes/1
  # GET /homes/1.json
  def show
  end

  # GET /homes/new
  def new
    @home = Home.new
  end

  # GET /homes/1/edit
  def edit
  end
  
  def contact
    @layout_frontend = 'contact page'
    @new_posts = Post.order("created_at DESC")
    @module_news_events = Post.joins(:tag).where(tags: { title: 'Sự kiện' }).order("created_at DESC").first(2)
  end
  
  def news
    @layout_frontend = 'page-header'
    @module_news_posts = Post.joins(:tag).where(tags: { title: 'Tin tức', title: 'Sự kiện' }).order("created_at DESC")
  end
  
  def intro
    @layout_frontend = 'contact page'
    @main_manufacturer = Manufacturer.where(manufacturers: { name: 'Chay vì sức khỏe' })
  end
  
  def service
    @layout_frontend = 'single'
    @module_services = Post.joins(:tag).where(tags: { title: 'Dịch vụ' }).order("created_at DESC")
    @module_new_services = Post.joins(:tag).where(tags: { title: 'Dịch vụ' }).order("created_at DESC").first(8)
  end
  
  def menu_product
    @layout_frontend = 'page menu-card'
  end
  
  def general_manufacturer
    @layout_frontend = 'tl-gallery page'
    @general_manufacturer = Manufacturer.all
  end

  # POST /homes
  # POST /homes.json
  def create
    @home = Home.new(home_params)

    respond_to do |format|
      if @home.save
        format.html { redirect_to @home, notice: 'Home was successfully created.' }
        format.json { render :show, status: :created, location: @home }
      else
        format.html { render :new }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /homes/1
  # PATCH/PUT /homes/1.json
  def update
    respond_to do |format|
      if @home.update(home_params)
        format.html { redirect_to @home, notice: 'Home was successfully updated.' }
        format.json { render :show, status: :ok, location: @home }
      else
        format.html { render :edit }
        format.json { render json: @home.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /homes/1
  # DELETE /homes/1.json
  def destroy
    @home.destroy
    respond_to do |format|
      format.html { redirect_to homes_url, notice: 'Home was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_home
      @home = Home.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def home_params
      params[:home]
    end
end
