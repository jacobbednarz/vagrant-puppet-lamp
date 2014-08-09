# Straight up LAMP stack - Built with Vagrant and Puppet

Setting up LAMP stacks shouldn't be difficult and the aim of this repository is
to allow developers to hit the ground running.

## Prerequisites

- [Vagrant](http://www.vagrantup.com/)
- [Virtual Box](https://www.virtualbox.org/)

## Instructions

- Get a Vagrant base box. (The base Ubuntu [precise64](http://files.vagrantup.com/precise64.box) is a good starter).
- Clone this repository.
```sh
$ git clone https://github.com/jacobbednarz/vagrant-puppet-lamp.git
```
- Change into the directory where this repository is cloned and run `vagrant up`.
- Put your code inside of the `webroot` directory.

And you're done. Your web server will now be available at http://localhost:8080.

## What's included?

- **Apache**
  - apache2
  - libapache2-mod-php5
- **MySQL**
  - mysql-server
- **PHP (5.3.10 with extensions)**
  - php5
  - php5-cli
  - php5-mysql
  - php-pear
  - php5-dev
  - php5-gd
  - php5-mcrypt
- **Misc**
  - curl
  - vim
  - htop

# Want to contribute?

If you find a bug or want to change something, open a [new issue](https://github.com/jacobbednarz/vagrant-puppet-lamp/issues/new) - extra points for pull requests or patches! :sparkles:
