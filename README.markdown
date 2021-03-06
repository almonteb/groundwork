# Groundwork
Groundwork is a set of rails templates that has the goal to jump-start the
development of rails applications by helping in the configuration of
development environment and with the implementation of features present
in the majority of web applications:

* Authentication
* Authorization
* Internationalization
* Basic Administration
* Basic Layout

In the best case it will permit a developer to focus in the
domain specific features of his application.

### Git
Uses git to create a fresh repository for the new application.

### Database
For rapid setup and prototyping the sqlite3 backend is used.

### Haml and Sass
Uses haml and sass as templating engines for the whole application.

### Authlogic
Implements the authentication logic using authlogic.

### BDD
A fully functional BDD environment is in place. The core gems are installed
and configured, in addition email-spec and remarkable are installed to
help in the specification of behaviors.

The template has 100% test code coverage.

### Remote Standalone templates.
Groundwork is compose of several templates, some have been
implemented so they can be used remotely and/or in existing rails applications:

`
$ rake rails:template LOCATION=http://github.com/hectoregm/groundwork/raw/master/<template>.rb
`

Right now you can use git and bdd templates in this way.

### Differences against Bort, BaseApp, etc

The main philosophy driving base is KISS: Keep it Short and Simple.
Each feature is implemented to be reusable for a full range
of applications, so you the developer focus in your features.

So while other app templates can have more bells and whistles
Base objective is to be a good base to begin the development
of features **you** need.

## Requirements
The following packages must be installed:

* git
* sqlite3-ruby
* rails >= 2.3.2

## Use
The `BASE_PATH` env variable must be set with the path to the base
directory of the groundwork repository

`
$ export BASE_PATH = <path to groundwork/base directory>
`

Then to generate the rails app we use:

`
$ rails <name app> -m groundwork/base.rb
`

## Implemented Features

* Authentication: Using authlogic gem.
  * Email activation.
  * Password reset.
* Configuration of a BDD environmnent.
* Test Coverage: >= 95%.
* Basic Layout (Based in pilu/web-app-theme).
* Internationalization. (:es being the only translated language)
* Ruby 1.9 Compatibility

## TODO
* Authorization
* Basic Administration

## Links
* [Git](http://git-scm.com/)
* [rspec](http://github.com/dchelimsky/rspec/tree/master)
* [rspec-rails](http://github.com/dchelimsky/rspec-rails/tree/master)
* [cucumber](http://github.com/aslakhellesoy/cucumber/tree/master)
* [webrat](http://github.com/brynary/webrat/tree/master)
* [remarkable](http://github.com/carlosbrando/remarkable/tree/master)
* [email-spec](http://github.com/bmabey/email-spec/tree/master)
* [forgery](http://github.com/sevenwire/forgery/tree/master)
* [machinist](http://github.com/notahat/machinist/tree/master)
* [authlogic](http://github.com/binarylogic/authlogic/tree/master)
* [haml](http://github.com/nex3/haml/tree/master)
* [web-app-theme](http://github.com/pilu/web-app-theme/tree/master)
* [rdiscount](http://github.com/rtomayko/rdiscount/tree/master)
* [formtastic](http://github.com/justinfrench/formtastic/tree/master)

## Licence
Copyright 2009 Hector E. Gomez M. Released under the MIT license
