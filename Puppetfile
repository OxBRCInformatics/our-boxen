# This file manages Puppet module dependencies.
#
# It works a lot like Bundler. We provide some core modules by
# default. This ensures at least the ability to construct a basic
# environment.

# Shortcut for a module from GitHub's boxen organization
def github(name, *args)
  options ||= if args.last.is_a? Hash
    args.last
  else
    {}
  end

  if path = options.delete(:path)
    mod name, :path => path
  else
    version = args.first
    options[:repo] ||= "boxen/puppet-#{name}"
    mod name, version, :github_tarball => options[:repo]
  end
end

# Shortcut for a module under development
def dev(name, *args)
  mod name, :path => "#{ENV['HOME']}/src/boxen/puppet-#{name}"
end

# Includes many of our custom types and providers, as well as global
# config. Required.

github "boxen", "3.3.4"

# Core modules for a basic development environment. You can replace
# some/most of these if you want, but it's not recommended.

github "dnsmasq",    "1.0.0"
github "foreman",    "1.0.0"
github "gcc",        "2.0.1"
github "git",        "1.2.5"
github "go",         "1.0.0"
github "homebrew",   "1.5.1"
github "hub",        "1.0.3"
github "inifile",    "1.0.0", :repo => "puppetlabs/puppetlabs-inifile"
github "nginx",      "1.4.2"
github "nodejs",     "3.3.0"
github "openssl",    "1.0.0"
github "phantomjs",  "2.0.2"
github "pkgconfig",  "1.0.0"
github "repository", "2.2.0"
github "ruby",       "6.7.2"
github "stdlib",     "4.1.0", :repo => "puppetlabs/puppetlabs-stdlib"
github "sudo",       "1.0.0"
github "xquartz",    "1.1.0"

# Optional/custom modules. There are tons available at
# https://github.com/boxen.

github "alfred",            "1.1.5"
github "dropbox",           "1.1.1"
github "chrome",            "1.1.1"
github "firefox",           "1.1.1"
github "spotify",           "1.0.1"
github "onepassword",       "1.0.2"
github "osx",               "1.6.0"
github "property_list_key", "0.1.0"
github "sysctl",            "1.0.0"
github "zsh",               "1.0.0"
github "iterm2",            "1.0.3"
github "vlc",               "1.0.5"
github "postgresql",        "2.0.1"
github "mysql",             "1.1.5"
github "mysql_workbench",   "1.0.3", :repo => "freakphp/puppet-mysql_workbench"
github "hipchat",           "1.0.8"
github "skype",             "1.0.5"
github "cyberduck",         "1.0.1"
github "virtualbox",        "1.0.6"
github "vagrant",           "2.0.12"
github "netbeans",          "1.0.0"
github "eclipse",           "2.2.0"
github "textmate",          "1.1.0"
github "jenkins",           "0.0.7"
github "mongodb",           "1.0.5"
github "adobe_reader",      "1.1.0"
github "gimp",              "1.0.0"
github "emacs",             "1.1.0"
github "groovy",			"1.0.0", :repo => "idris/puppet-groovy"
github "intellij",          "1.4.0"
github "groovy",			"1.0.0", :repo => "idris/puppet-groovy"
