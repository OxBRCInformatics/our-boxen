# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

def github(name, version, options = nil)
  options ||= {}
  options[:repo] ||= "boxen/puppet-#{name}"
  mod name, version, :github_tarball => options[:repo]
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen",      "3.0.2"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "autoconf",   "1.0.0"
github "dnsmasq",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "homebrew",   "1.4.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.2.9"
github "openssl",    "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.3.4"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

github "emacs"
github "sparrow"
github "zsh"
github "chrome::stable"
github "onepassword"
github "dropbox"
github "alfred"
github "macvim"
github "zsh"
github "homebrew"
github "iterm2::dev"
github "java"
github "textmate"
github "virtualbox"
github "skype"
github "caffeine"
github "istatmenus3"
github "spotify"
github "vlc"
github "watts"
github "postgresql"
github "apachedirectorystudio"
github "mysql_workbench"
github "heroku_toolbelt"
github "firefox"
github "libreoffice"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.
