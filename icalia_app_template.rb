remove_file "README.rdoc"
create_file "README.md", "TODO"

#Especify ruby version to be at least version 2.0.0
inject_into_file "Gemfile", after: "source 'https://rubygems.org'" do <<-'RUBY'
  ruby '2.0.0'
RUBY
end

gem "figaro"
gem "unicorn"

gem_group :test do
  gem "rspec-rails"
  gem "cucumber-rails", require: false
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

run 'bundle install --quiet'

#Generates figaro configuration
generate "figaro:install"
#TODO: add application_example.yml

#Generates unicorn configuration
create_file "Procfile", "web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb"
copy_file '~/workspace/customGenerator/unicorn_template.rb', 'config/unicorn.rb'

#Generates rspec config
generate "rspec:install"

#Generates cucumber
generate "cucumber:install"
