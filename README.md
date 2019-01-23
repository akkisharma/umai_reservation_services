# README


Things you need to do for application setup:
---------------------------------------------------------


# Install Ruby version:

	- ruby 2.6.0p0


# Install Rails Version:

	- Rails 5.2.2

# download all gem dependencies:

	- bundle install

# Database setup:

	For Development environment:
	- rails db:create
	- rails db:migrate
	- rails db:seed

	For Test environment:
	- rails db:test:prepare
	- rails db:seed


# Run the rails server:

	- rails s


# Consume rails API with running IP and port

	- API list given in project documentation


# Run RSpec:

	- bundle exec rspec --format documentation
