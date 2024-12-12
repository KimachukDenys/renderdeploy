class AddDeviseToUsers < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      # Перевіряємо, чи колонки вже існують, перед додаванням
      unless column_exists?(:users, :email)
        t.string :email, default: '', null: false
      end

      unless column_exists?(:users, :encrypted_password)
        t.string :encrypted_password, null: false, default: ""
      end

      unless column_exists?(:users, :reset_password_token)
        t.string :reset_password_token
      end

      unless column_exists?(:users, :reset_password_sent_at)
        t.datetime :reset_password_sent_at
      end

      unless column_exists?(:users, :remember_created_at)
        t.datetime :remember_created_at
      end

      unless column_exists?(:users, :sign_in_count)
        t.integer :sign_in_count, default: 0, null: false
      end

      unless column_exists?(:users, :current_sign_in_at)
        t.datetime :current_sign_in_at
      end

      unless column_exists?(:users, :last_sign_in_at)
        t.datetime :last_sign_in_at
      end

      unless column_exists?(:users, :current_sign_in_ip)
        t.inet :current_sign_in_ip
      end

      unless column_exists?(:users, :last_sign_in_ip)
        t.inet :last_sign_in_ip
      end
    end
  end
end
