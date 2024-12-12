module Admin
  class OrdersController < ApplicationController
    before_action :authenticate_user!
    before_action :check_admin

    def index
      @orders = Order.includes(:user, :order_items).all
    end

    def show
      @order = Order.find(params[:id])
    end

    private

    def check_admin
      unless current_user.admin?
        redirect_to root_path, alert: 'У вас немає доступу до цієї сторінки!'
      end
    end
  end
end
  