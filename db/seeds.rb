class Seed

  def self.begin
    seed = Seed.new
    seed.generate_products
  end

  def generate_products
    20.times do |i|
      product = Product.create!(name: Faker::Commerce.product_name, price: rand(10...100), description: Faker::Lorem.sentence(5, false, 0).chop)
      word = product.name.split
      product.image_url = "https://loremflickr.com/320/240/#{word.last}/?lock=1"
    end
  end
end

Seed.begin
