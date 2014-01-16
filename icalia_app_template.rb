remove_file "README.rdoc"
create_file "README.md", "TODO"

gem "figaro"
gem "unicorn"

gem_group :test do
  gem "rspec-rails"
  gem "cucumber-rails"
  gem "database_cleaner"
  gem "email_spec"
  gem "shoulda-matchers"
  gem "capybara"
  gem 'ffaker'
  gem 'selenium-webdriver'
end

gem_group :development, :test do
  gem "debugger"
  gem "factory_girl_rails"
end

gem_group :production do
  gem "rails_12factor"
end

gem_group :development do
  gem "better_errors"
  gem "binding_of_caller"
end
