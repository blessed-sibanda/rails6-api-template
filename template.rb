gem "jbuilder", "~> 2.7"
gem "image_processing", "~> 1.2"
gem "rack-cors"
gem "devise", "~> 4.8"
gem "devise-jwt", "~> 0.9.0"
gem "pager_api", "~> 0.3.2"
gem "will_paginate", "~> 3.3"
gem "pagy", "~> 5.6"
gem "kaminari", "~> 1.2"
gem "haml-rails", "~> 2.0"

gem_group :development, :test do
  gem "rspec-rails", "~> 5.0.2"
  gem "factory_bot_rails", "~> 6.2.0"
  gem "shoulda-matchers", "~> 5.0"
  gem "faker"
end

gem_group :test do
  gem "email_spec", "~> 2.2.0"
end

rails_command "g rspec:install"
run "rm -rf spec"

git clone: "https://github.com/blessed-sibanda/rails-auth-api.git"

run "cp rails-auth-api/db/migrate db/migrate -r"

run "cp rails-auth-api/spec spec -r"

run "rm -rf config/initializers"
run "cp rails-auth-api/config/initializers config/initializers -r"

run "rm config/routes.rb"
run "cp rails-auth-api/config/routes.rb config"

run "rm -rf app"
run "cp rails-auth-api/app app -r"

run "cp rails-auth-api/'thunder-collection_Rails Auth API.json' thunder-collection_API.json"

run "rm -rf rails-auth-api"

environment 'config.action_mailer.default_url_options = {host: "http://localhost", port: 3000}', env: "development"

environment 'config.action_mailer.default_url_options = {host: "example.com", port: 3000}', env: "test"

git :init
git add: "."
git commit: %Q{ -m 'init project' }
