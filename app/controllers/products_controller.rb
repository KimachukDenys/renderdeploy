class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @categories = Category.all.pluck(:name, :id)  # Збираємо всі категорії
    @products = Product.all
    @products = Product.all.page(params[:page]).per(12)

    # Фільтрація за категорією
    if params[:category].present?
      @products = @products.where(category_id: params[:category])
    end

    # Фільтрація за ціною
    if params[:min_price].present? && params[:max_price].present?
      @products = @products.where(price: params[:min_price]..params[:max_price])
    end

    # Пошук по назві
    if params[:search].present?
      @products = @products.where('name LIKE ?', "%#{params[:search]}%")
    end
  end

  def show
    # Завантажуємо товар за переданим id
    @product = Product.find_by(id: params[:id])

    # Якщо товар не знайдений, можемо перенаправити або показати повідомлення про помилку
    if @product.nil?
      flash[:alert] = "Товар не знайдений"
      redirect_to products_path
    end
  end

  def new
    @product = Product.new
    @categories = Category.all
  end


  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :image)
  end

end
