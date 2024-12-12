class CartsController < ApplicationController
  before_action :authenticate_user!

  # Показати вміст кошика
  def show
    @cart_items = []
    @total_price = 0

    if session[:cart].present? && session[:cart].is_a?(Hash)
      session[:cart].each do |product_id, quantity|
        product = Product.find_by(id: product_id)
        if product
          @cart_items << { product: product, quantity: quantity }
          @total_price += product.price * quantity
        end
      end
    end
  end

  # Додати товар до кошика
  def add_item
    product = Product.find_by(id: params[:product_id])
    return render json: { success: false, message: 'Товар не знайдено!' }, status: 404 unless product

    quantity = params[:quantity].to_i
    if quantity <= 0
      return render json: { success: false, message: 'Кількість має бути більше нуля!' }, status: 400
    end

    session[:cart] ||= {}

    # Перевірка типу session[:cart] перед використанням
    if session[:cart].is_a?(Hash)
      if session[:cart].key?(product.id.to_s)
        session[:cart][product.id.to_s] += quantity
      else
        session[:cart][product.id.to_s] = quantity
      end
    else
      # Якщо session[:cart] не є хешем, ініціалізуємо його як порожній хеш
      session[:cart] = {}
      session[:cart][product.id.to_s] = quantity
    end

    respond_to do |format|
      format.html { redirect_to root_path, notice: "#{product.name} успішно додано до кошика." }
      format.json do
        render json: {
          success: true,
          message: "#{product.name} успішно додано до кошика.",
          cart_count: session[:cart].values.sum
        }
      end
    end
  end

  # Видалити товар з кошика
  def remove_item
    session[:cart].delete(params[:product_id])
    redirect_to '/carts/show', notice: "Товар видалено з кошика"
  end
end
