namespace :category_rake do
	task :create => :environment do
		seed_category
	end

	def seed_category
		JSON.parse(open("#{Rails.root}/docs/categories.json").read).each do |category_json|
			category = Category.new(category_json)
			category.save!
		end
	end
end