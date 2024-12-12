# lib/import_data_from_backup.rb

require 'pg'
require 'uri'

database_url = ENV['DATABASE_URL'] || 'postgresql://render_rails_c5i1_user:XNrfqzPCBH3YP6ZTw5j1LLN65am3EYvX@dpg-ctdkq9lumphs7395vlg0-a/render_rails_c5i1'

uri = URI.parse(database_url)

database_user = uri.user
database_password = uri.password
database_host = uri.host
database_port = uri.port || 5432
database_name = uri.path[1..-1]  # Вилучаємо ім'я бази даних

connection = PG.connect(
  host: database_host,
  port: database_port,
  dbname: database_name,
  user: database_user,
  password: database_password
)

backup_file_path = 'backup.sql'

if File.exist?(backup_file_path)
  command = "psql -h #{database_host} -U #{database_user} -d #{database_name} -f #{backup_file_path}"
  system(command)
  puts "Дані успішно завантажено до бази даних."
else
  puts "Файл backup.sql не знайдений!"
end

connection.close
