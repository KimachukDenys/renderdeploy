# app/controllers/admin/categories_controller.rb
class Admin::CategoriesController < ApplicationController
    before_action :authenticate_user!
    before_action :authenticate_admin!
  
    def index
      @categories = Category.all
    end
  
    def new
      @category = Category.new
    end
  
    def create
      @category = Category.new(category_params)
  
      if @category.save
        redirect_to admin_categories_path, notice: "Категорія успішно додана."
      else
        render :new
      end
    end
  
    def edit
      @category = Category.find(params[:id])
    end
  
    def update
      @category = Category.find(params[:id])
  
      if @category.update(category_params)
        redirect_to admin_categories_path, notice: "Категорія успішно оновлена."
      else
        render :edit
      end
    end
  
    def destroy
      @category = Category.find(params[:id])
      @category.destroy
      redirect_to admin_categories_path, notice: "Категорія успішно видалена."
    end
  
    private
  
    def category_params
      params.require(:category).permit(:name, :description)
    end
  
    def authenticate_admin!
      redirect_to root_path, alert: "Немає доступу!" unless current_user.role == "admin"
    end
  end
  