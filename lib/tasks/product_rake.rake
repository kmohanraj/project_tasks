namespace :product_rake do
	task :create => :environment do
		seed_product
	end

	def seed_product
		JSON.parse(open("#{Rails.root}/docs/products.json").read).each do |product_json|
			product = Product.new(product_json)
			product.save!
		end
	end
end