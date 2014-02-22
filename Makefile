all: build_gem

example:
	ruby example.rb

deploy:
	gem push rukeyboard*.gem

install:
	gem install rukeyboard*.gem

build_gem:
	rm -f *.gem
	gem build rukeyboard.gemspec
