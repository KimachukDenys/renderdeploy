# db/seeds.rb

# Створення кількох категорій для продуктів (якщо ще не існують)
category1 = Category.create(name: "Техніка")
category2 = Category.create(name: "Електроніка")

# Створення кількох продуктів
Product.create([
  { name: "Телевізор", description: "Смарт телевізор з 4K роздільною здатністю", price: 999.99, category: category1, image: "tv.jpg" },
  { name: "Ноутбук", description: "Потужний ноутбук для роботи і розваг", price: 1500.50, category: category2, image: "laptop.jpg" },
  { name: "Смартфон", description: "Модний смартфон з великою камерою", price: 799.99, category: category2, image: "smartphone.jpg" },
  { name: "Холодильник", description: "Енергоефективний холодильник з морозильною камерою", price: 499.00, category: category1, image: "fridge.jpg" },
  { name: "Кавоварка", description: "Автоматична кавоварка з функцією еспресо", price: 120.00, category: category1, image: "coffee_machine.jpg" }
])

puts "Продукти успішно створені!"
