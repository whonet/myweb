source 'https://rubygems.org'
ruby '2.0.0'
#ruby-gemset=railstutorial_rails_4_0

gem 'rails', '4.0.4'
gem 'bootstrap-sass', '2.3.2.0'
gem 'mysql2'
gem 'bcrypt-ruby', '3.1.2'  # 密码加密导入 配合password_digest使用
gem 'faker','1.1.2'			# 帮助狠容易产生大量注册用户
gem 'will_paginate', '3.0.4'	# 产生users分页
gem 'bootstrap-will_paginate', '0.0.9' # 产生users分页

group :development, :test do
  #gem 'sqlite3', '1.3.8'
  gem 'rspec-rails', '2.13.1'
  gem 'guard-rspec', '2.5.0'
  gem 'spork-rails', '4.0.0'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
end

group :test do
  gem 'selenium-webdriver', '2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'  # 预构件，可以快速创建具体用户
  gem 'cucumber-rails', '1.4.0', :require => false
  gem 'database_cleaner', github: 'bmabey/database_cleaner'
end

gem 'sass-rails', '4.0.2'
gem 'sprockets', '2.11.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '4.0.1'
gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'jbuilder', '1.0.2'

group :doc do
  gem 'sdoc', '0.3.20', require: false
end

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
end