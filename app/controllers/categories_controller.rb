class CategoriesController < ApplicationController
  def index
    @categories = Category.all
    # інший код для відображення товарів
  end

  def show
    @category = Category.find(params[:id])  # Отримуємо категорію за ID
    @categories = Category.all               # Отримуємо всі категорії для випадаючого списку
    @products = @category.products           # Отримуємо всі продукти цієї категорії
    @products = Product.all.page(params[:page]).per(12)

    # Фільтрація товарів за параметрами (якщо вони є)
    if params[:search].present?
      @products = @products.where("name LIKE ?", "%#{params[:search]}%")
    end
    if params[:min_price].present?
      @products = @products.where("price >= ?", params[:min_price].to_f)
    end
    if params[:max_price].present?
      @products = @products.where("price <= ?", params[:max_price].to_f)
    end
  end
end
