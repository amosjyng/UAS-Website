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

To add the first officer (which must be added manually into the database), start up rails console from the commandline and do something similar to:

$ rails console
=> Officer.create :email => "amosjyng@gmail.com", :name => "Amos Ng", :position => "Webmaster", :password => "something secure", is_president => "true"
