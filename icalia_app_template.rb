GENERATOR_TEMPLATE_PATH = "~/.icalialabs_rails_generator_template"
remove_file "README.rdoc"
create_file "README.md", @app_name.capitalize

ruby_version = `rbenv global`.strip

if yes? "Do you want to set the Ruby version for the project?"
  unless yes? "Is Ruby #{ruby_version} you current version?"
    ruby_version = ask "What version of Ruby are yo going to use?"#Especify ruby version to be at least version 2.0.0
  end

  inject_into_file "Gemfile", after: "source 'https://rubygems.org'\n\n" do
    %Q{
ruby '#{ruby_version}'
    }
  end
end

gem "figaro"
gem "puma"

# Test gems
gem_group :test do
  gem "database_cleaner"
  gem "shoulda-matchers"
end

# API gems
if yes? "Are you building an API?"
  gem "versionist"
  gem "active_model_serializers", github: "rails-api/active_model_serializers", branch: "0-8-stable"
end

# Rspec and Factories
gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'pry'
end

# Production and staging gems
gem_group :production, :staging do
  gem "rails_12factor"
end

# User Handling
if yes? "Do you want to add devise auth?"
  gem "devise"
  run 'bundle install --quiet'
  generate "devise:install"
  application(nil, env: 'development') do
    "config.action_mailer.default_url_options = { :host => 'localhost:3000' }"
  end
  if yes? "Do you want me to create a User model for authentication?"
    generate "devise User"
  end
end

run 'bundle install --quiet'

#Generates figaro configuration
run 'figaro install'
#TODO: add application_example.yml

#Generates puma configuration
create_file "Procfile", "web: bundle exec puma -t 5:5 -p ${PORT:-3000} -e ${RACK_ENV:-development}"

#Generates rspec config
generate "rspec:install"

#Configures spec/spec_helper.rb file
directory "#{GENERATOR_TEMPLATE_PATH}/rspec_support_files", 'spec/support', :recursive => false

#Configures application.rb
application do
  "# don't generate RSpec tests for views and helpers
  config.generators do |g|
    g.test_framework :rspec, fixture: true
    g.fixture_replacement :factory_girl, dir: 'spec/factories'
    g.view_specs = false
    g.helper_specs = false
    g.stylesheets = false
    g.javascripts = false
    g.helper = false
  end
  
  config.autoload_paths += %W(\#{config.root}/lib)"
end

#Prepare for heroku staging env 
run "cp config/environments/production.rb config/environments/staging.rb"


#Git configuration
git :init
append_file ".gitignore", "/config/database.yml\n"
append_file ".gitignore", ".sass-cache/*\n"
append_file ".gitignore", ".DS_Store\n"
append_file ".gitignore", "*.dump\n"
append_file ".gitignore", "/public/uploads\n" #For when using carrierwave later on
run "cp config/database.yml config/example_database.yml"
copy_file "#{GENERATOR_TEMPLATE_PATH}/templates/figaro_application.yml", 'config/example_application.yml'
git add: "."

if yes? "Do you want me to add an initial commit?"
  commit_message = ask("What should I establish as message")
  git commit: "-m '#{commit_message}'"
end

if yes? "Do you want me to add the remote?"
  remote = ask("What is the remote git URL?")
  run "git remote add origin #{remote}"
end

readme "#{GENERATOR_TEMPLATE_PATH}/README"
