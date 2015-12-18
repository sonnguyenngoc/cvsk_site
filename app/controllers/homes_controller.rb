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
    @module_news_posts = Post.joins(:tag).where("tags.title = 'Tin tức' OR tags.title = 'Dịch vụ' ").order("created_at DESC").first(3)
    @module_news_events = Post.joins(:tag).where(tags: { title: 'Sự kiện' }).order("created_at DESC").first(2)
    @module_run_events = Post.joins(:tag).where("tags.title = 'Sự kiện' AND posts.run_check = 'True' ").order("created_at DESC").first(3)
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
    @contact = Contact.new
    @layout_frontend = 'contact page'
    @module_news_posts = Post.joins(:tag).where("tags.title = 'Tin tức' OR tags.title = 'Dịch vụ' ").order("created_at DESC").first(2)
    @module_news_events = Post.joins(:tag).where(tags: { title: 'Sự kiện' }).order("created_at DESC").first(2)
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def news
    @layout_frontend = 'page-header'
    @module_news_posts = Post.joins(:tag).where("tags.title = 'Tin tức' OR tags.title = 'Sự kiện' ").order("created_at DESC")
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def intro
    @layout_frontend = 'contact page'
    @main_manufacturer = Manufacturer.where(manufacturers: { name: 'Chay vì sức khỏe' })
    @listing_images = ManufacturerImage.all
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def service
    @layout_frontend = 'single'
    @module_services = Post.joins(:tag).where(tags: { title: 'Dịch vụ' }).order("created_at DESC")
    @module_new_services = Post.joins(:tag).where(tags: { title: 'Dịch vụ' }).order("created_at DESC").first(4)
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def menu_product
    @parent_categories = Category.where("categories.level = '1'")
    @module_general_benefit = Post.joins(:tag).where("tags.title = 'Sự kiện' AND posts.general_benefit != ''").order("created_at DESC").first(3)
    @module_menu_content = MenuContent.order("created_at DESC").first(1)
    @layout_frontend = 'page menu-card'
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def general_manufacturer
    @layout_frontend = 'tl-gallery page'
    @general_manufacturer = Manufacturer.all
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def post_detail
    @layout_frontend = 'contact page'
    @posts = Post.find(params[:id])
    @module_news_posts = Post.joins(:tag).where("tags.title = 'Tin tức' OR tags.title = 'Sự kiện' OR tags.title = 'Dịch vụ' ").order("created_at DESC").first(5)
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def product_detail
    @layout_frontend = 'contact page'
    @products = Product.find(params[:id])
    @listing_product = Product.all
    @posts = Post.all
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def manufacturer_detail
    @layout_frontend = 'contact page'
    @manufacturers = Manufacturer.find(params[:id])
    @listing_product = Product.all
    @listing_images = ManufacturerImage.all
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def picture_detail
    @layout_frontend = 'page-header'
    @posts = Post.find(params[:id])
    @module_new_pictures = Post.joins(:tag).where(tags: { title: 'Hình ảnh' }).order("created_at DESC").first(5)
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def reservation
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def confirm_order
    @layout_frontend = 'reservation page'
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
  end
  
  def picture
    @layout_frontend = 'tl-gallery page'
    @module_pictures = Post.joins(:tag).where(tags: { title: 'Hình ảnh' })
    @module_new_products = Product.order("created_at DESC").first(2)
    @module_introduction = Post.joins(:tag).where(tags: { title: 'Lời giới thiệu' }).order("created_at DESC").first(1)
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
