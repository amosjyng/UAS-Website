UAS-Website
===========

UCLA Undergraduate Astronomical Society Website

To run the webserver, first install Ruby, Rails, and Git. Then execute in a terminal:

$ sudo apt-get install libsqlite3-dev sqlite3
$ git clone https://github.com/amosjyng/UAS-Website.git
$ cd UAS-Website
$ bundle install
$ rake db:create
$ rake db:migrate
$ rails server

and direct your browser to localhost:3000
