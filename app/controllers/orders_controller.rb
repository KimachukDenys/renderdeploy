class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_cart_items, only: [:new, :create]
  before_action :set_user
  before_action :set_order, only: [:destroy]

  def index
    @orders = Order.all
    @orders = current_user.orders
  end
  
  def show
    @order = Order.find_by(id: params[:id])
    if @order.nil?
      flash[:alert] = "Замовлення не знайдено"
      redirect_to orders_path
    else
      @order.order_items.each do |item| 
        Rails.logger.debug("Назва продукту: #{item.product.name}")
      end    
      Rails.logger.debug("Замовлення знайдено: #{@order.inspect}")
      Rails.logger.debug("Ім'я замовлення: #{@order.name}")
    end
  end  

  # Метод для відображення форми створення нового замовлення
  def new
    Rails.logger.debug("Кошик перед обробкою: #{session[:cart].inspect}")
    # Ініціалізація інших полів
    @payment_methods = ["Наложений платіж", "Карткою на сайті", "Післяплата в магазині"]
    @order = Order.new
    @user = current_user
    api_key = '31f748945b0d2454c5ad2f318df049c2'
    
    # Ініціалізація даних замовлення
    @order.name = @user.name
    @order.email = @user.email
    @order.phone = @user.phone
    
    # Завантаження товарів з кошика
    if session[:cart].present?
      @cart_items = session[:cart].map do |product_id, quantity|
        product = Product.find_by(id: product_id)
        { product: product, quantity: quantity } if product
      end.compact
      @total = @cart_items.sum { |item| item[:product].price * item[:quantity] } # Обчислюємо загальну вартість
    else
      redirect_to cart_path, alert: 'Ваш кошик порожній.'
      return
    end
    
    # Отримуємо список міст з API або іншого джерела
    @cities = get_cities_from_api(api_key) || []
    
    # Перевірка, чи є міста
    if @cities.empty?
      flash[:alert] = "Не вдалося отримати список міст."
    end
  end
  
  
  # Метод для створення нового замовлення
  def create
    Rails.logger.debug("Кошик перед обробкою: #{session[:cart].inspect}")
    
    @order = Order.new(order_params)
    @order.user = current_user
    @order.name ||= current_user.name
    @order.email ||= current_user.email
    @order.phone ||= current_user.phone
  
    # Завантаження кошика з сесії
    @cart_items = session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      if product
        { product: product, quantity: quantity }
      else
        Rails.logger.warn("Продукт не знайдено для ID: #{product_id}")
      end
    end.compact
  
    if @cart_items.blank?
      flash[:alert] = "Ваш кошик порожній!"
      return render :new
    end
  
    # Логування наявних товарів у кошику
    Rails.logger.debug("Товари в кошику: #{@cart_items.inspect}")
    
    # Обчислення загальної вартості
    @total = @cart_items.sum { |item| item[:product].price * item[:quantity] }
    @order.total = @total  # Присвоєння загальної вартості замовленню
    
    Rails.logger.debug("Загальна вартість: #{@total}")
  
    # Спочатку збережемо замовлення
    if @order.save
      # Очищення кошика після створення замовлення
      session[:cart] = []
  
      # Перенаправлення на сторінку замовлення
      redirect_to @order, notice: 'Замовлення успішно створено!'
    else
      flash[:alert] = "Не вдалося створити замовлення!"
      Rails.logger.debug("Помилки замовлення: #{@order.errors.full_messages}")
      render :new
    end
  end

  
  def destroy
    if @order.destroy
      redirect_to user_path(@user), notice: 'Замовлення успішно видалено.'
    else
      redirect_to user_path(@user), alert: 'Не вдалося видалити замовлення.'
    end
  end
  

  def sync_cities
    api_key = '31f748945b0d2454c5ad2f318df049c2'
    response = HTTParty.post('https://api.novaposhta.ua/v2.0/json/', body: {
      "modelName": "Address",
      "calledMethod": "getCities",
      "apiKey": api_key
    }.to_json, headers: { 'Content-Type' => 'application/json' })
  
    cities_data = response.parsed_response['data']
    return if cities_data.blank?
  
    cities_data.each do |city|
      City.find_or_create_by(ref: city['Ref']) do |c|
        c.name = city['Description']
        c.area = city['Area']
        c.area_description = city['AreaDescription']
      end
    end
  end

  # Метод для отримання міст
  def get_cities
    query = params[:query]
    cities = Rails.cache.fetch("novaposhta_cities", expires_in: 12.hours) do
      City.where("name LIKE ?", "%#{query}%").pluck(:name)
    end
    render json: { cities: cities }
  end

  # Метод для отримання відділень по вибраному місту
  def get_warehouses_for_city
    city_name = params[:city_name]
    api_key = '31f748945b0d2454c5ad2f318df049c2'
    response = get_warehouses(api_key, city_name)
    
    if response && response['data'].present?
      @novaposhta_offices = response['data']
      render json: { offices: @novaposhta_offices }
    else
      render json: { offices: [] }
    end
  end

  private

  # Пошук користувача за id
  def set_user
    @user = current_user # використовуємо current_user замість params[:id]
    if @user.nil?
      redirect_to root_path, alert: 'Користувача не знайдено.'
    end
  end
  


  # Пошук замовлення для конкретного користувача
  def set_order
    @order = @user.orders.find_by(id: params[:id])
    if @order.nil?
      redirect_to user_path(@user), alert: 'Замовлення не знайдено.'
    end
  end
  

  # Метод для отримання списку міст з API Нова Пошта
  def get_cities_from_api(api_key)
    uri = URI.parse('https://api.novaposhta.ua/v2.0/json/')
    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
  
    request.body = {
      "apiKey" => api_key,
      "modelName" => "Address",
      "calledMethod" => "getCities",
      "methodProperties" => {}
    }.to_json
  
    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end
  
    result = JSON.parse(response.body)
    Rails.logger.debug("API Response: #{result}")  # Логування відповіді від API
    result['data'] || []  # Повертаємо порожній масив, якщо дані відсутні
  rescue StandardError => e
    Rails.logger.error("Error fetching cities: #{e.message}")
    nil
  end
  
  # Метод для отримання відділень по місту з API Нова Пошта
  def get_warehouses(api_key, city_name)
    uri = URI.parse('https://api.novaposhta.ua/v2.0/json/')
    request = Net::HTTP::Post.new(uri)
    request["Content-Type"] = "application/json"
    
    request.body = {
      "apiKey" => api_key,
      "modelName" => "Address",
      "calledMethod" => "getWarehouses",
      "methodProperties" => { "CityName" => city_name }
    }.to_json

    begin
      response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(request)
      end

      JSON.parse(response.body)
    rescue StandardError => e
      Rails.logger.error("Помилка при отриманні відділень: #{e.message}")
      { 'data' => [] } # Повертаємо порожній масив у випадку помилки
    end
  end

  def set_cart_items
    @cart_items = session[:cart].map do |product_id, quantity|
      product = Product.find_by(id: product_id)
      { product: product, quantity: quantity } if product
    end.compact
  end

  # Перевірка параметрів замовлення
  def order_params
    params.require(:order).permit(
      :total,
      :name,
      :email,
      :phone,
      :delivery_method,
      :city,
      :warehouse_name,
      :payment_method,
      order_items_attributes: [:product_id, :quantity]
    )
  end
end

