module Admin
    class ProductsController < ApplicationController
      before_action :authenticate_user!
      before_action :check_admin
      before_action :set_product, only: [:edit, :update, :destroy]
  
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
  
      def new
        @product = Product.new
        @categories = Category.all
      end
  
      def create
        @product = Product.new(product_params)
        if @product.save
          redirect_to admin_products_path, notice: 'Товар успішно створено!'
        else
          @categories = Category.all
          render :new
        end
      end
  
      def edit
        @categories = Category.all
      end
  
      def update
        if @product.update(product_params)
          redirect_to admin_products_path, notice: 'Товар успішно оновлено!'
        else
          @categories = Category.all
          render :edit
        end
      end
  
      def destroy
        @product = Product.find(params[:id])
        @product.destroy
        redirect_to admin_products_path, notice: 'Товар успішно видалено!'
      end
  
      private
  
      def set_product
        @product = Product.find(params[:id])
      end
  
      def product_params
        params.require(:product).permit(:name, :description, :price, :category_id, :image)
      end
  
      def check_admin
        unless current_user.admin?
          redirect_to root_path, alert: 'У вас немає доступу до цієї сторінки!'
        end
      end
    end
  end
  