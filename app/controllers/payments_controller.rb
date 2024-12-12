class PaymentsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])  # Знайдемо замовлення
  end

  def create
    @order = Order.find(params[:order_id])
    token = params[:stripeToken]  # Токен, що створюється на клієнтській стороні (у JavaScript)

    begin
      # Створюємо платіж
      charge = Stripe::Charge.create(
        amount: (@order.total * 100).to_i,  # Сума в центрах
        currency: 'usd',
        description: "Order ##{@order.id}",
        source: token  # Токен, отриманий з форми
      )

      # Оновлюємо статус замовлення
      @order.update(status: 'paid')

      redirect_to order_path(@order), notice: "Платіж успішно здійснено!"
    rescue Stripe::CardError => e
      flash[:alert] = e.message
      redirect_to new_payment_path(order_id: @order.id)
    end
  end
end
