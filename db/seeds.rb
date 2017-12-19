
User.create!(email: 'saran@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'yuhabharathi@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'guruprasad@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'sakthi@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
User.create!(email: 'ruby@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Rake::Task['category_rake:create'].execute
Rake::Task['product_rake:create'].execute