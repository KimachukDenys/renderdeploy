class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email])
    if user&.valid_password?(params[:password])  # Використовуємо Devise метод для перевірки пароля
      session[:user_id] = user.id
      redirect_to root_path, notice: 'Ви успішно увійшли!'
    else
      flash.now[:alert] = 'Невірний email або пароль'
      render :new
    end
  end
end
