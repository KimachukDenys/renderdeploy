namespace :novaposhta do
    desc "Синхронізація міст з API Нова Пошта"
    task sync_cities: :environment do
      OrdersController.new.sync_cities
      puts "Список міст успішно синхронізовано."
    end
  end
  