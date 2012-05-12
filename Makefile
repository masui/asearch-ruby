push:
	echo 'make gempush/gitpush'
local:
	rake package
	sudo gem install pkg/asearch-0.0.1.gem
gempush:
	rake package
	gem push pkg/asearch-0.0.1.gem
gitpush:
	git push git@github.com:masui/asearch-ruby.git
	git push pitecan.com:/home/masui/git/asearch-ruby.git
always:	
test: always
	rake test
