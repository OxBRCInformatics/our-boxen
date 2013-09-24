class people::spikeheap {
	# TODO add to puppetfile
  include emacs   
	include zsh
	include chrome
	include firefox
	include onepassword
	include dropbox
	include alfred
	include macvim
	include zsh
	include homebrew
	include iterm2::dev
  #include libreoffice
  #include java
  include textmate::textmate2::beta
	include virtualbox
	include skype
	include caffeine
	include istatmenus3
	include vlc
	include watts
	include postgresql
	include hipchat
	include skype
	include cyberduck

	# Projects
	# e.g. include projects::puppet
	
	
  # Configuration Setup
  $env = {
    directories => {
      home      => "/Users/${::luser}",
      dotfiles  => "/Users/${::luser}/.dotfiles"
    },
    dotfiles => [
      'aliases',
      'functions',
      'gitconfig',
      #'janus/jellybeans',
      #'janus/vim-rails',
      'vimrc.after',
      #'zshrc',
      'zshenv'
    ],
    packages => {
      brew   => [
				'bash',
        'wget',
        'gpg2',
        'tmux'
      ]
    }
  }
 
  # Install Brew Applications
  package { $env['packages']['brew']:
    provider => 'homebrew',
  }
	
	# Dotfile Setup
	# TODO point to Bitbucket
  repository { 'spikeheap-dotfiles':
    source  => 'spikeheap/dotfiles',
    path    => "${env['directories']['dotfiles']}",
  }

	### This really shoudl be a shell script. DO IT!
	-> people::spikeheap::dotfile::link { $env['dotfiles']:
	  source_dir => $env['directories']['dotfiles'],
	  dest_dir   => $env['directories']['home'],
	}
 
	# Install Janus
	repository { 'janus':
	  source => 'carlhuda/janus',
	  path   => "${env['directories']['home']}/.vim",
	}
	~> exec { 'Boostrap Janus':
	  command     => 'rake',
	  cwd         => "${env['directories']['home']}/.vim",
	  refreshonly => true,
	  environment => [
	    "HOME=${env['directories']['home']}",
	  ],
	}
 
	# Misc Helpers until I can figure out where to put this
	define dotfile::link($source_dir, $dest_dir) {
	  file { "${dest_dir}/.${name}":
	    ensure => symlink,
	    target => "${source_dir}/${name}",
	  }
	}

	
	# TODO
  #	file {
  #		"/Users/${::boxen_user}/.ssh":
  #	  ensure => directory;
  #	"/Users/${::boxen_user}/.ssh/config":
  #	  source => 'puppet:///modules/people/wfarr/ssh_config';
  #}
	
	# TODO
  #file { "/Users/${::luser}/.gitignore":
  #		ensure => present,
  #   source => 'puppet:///modules/people/spikeheap/gitignore'
  #}
	
	
	

	# Sane Defaults
	Boxen::Osx_defaults {
		user => $::luser,
	}

	case $::hostname {
		'airic': {
		  
		}
		'ryan-imac': {
		  include projects::all
		}
		default: {}
	}
		
  #$home     = "/Users/${::boxen_user}"
	$home     = "/Users/${::luser}"
  $my       = "${home}/my"
  $dotfiles = "${my}/dotfiles"
  
  file { $my:
    ensure  => directory
  }


	
	git::config::global {
	  'alias.st':   value => 'status';
	  'alias.ci':   value => 'commit';
	  'alias.co':   value => 'checkout';
	  'alias.di':   value => 'diff';
	  'alias.dc':   value => 'diff --cached';
	  'alias.lp':   value => 'log -p';
	  'color.ui':   value => 'true';
	  'user.name':  value => 'Ryan Brooks';
	  'user.email': value => 'ryanbrooksis@gmail.com';
	}

  repository { 'oh-my-zsh':
     source => 'spikeheap/oh-my-zsh',
     path   => "/Users/${::luser}/.oh-my-zsh"
   }
 
   file { "/Users/${::luser}/.zshrc":
     ensure  => link,
     target  => "/Users/${::luser}/.oh-my-zsh/templates/zshrc.zsh-template",
     require => Repository['oh-my-zsh']
   }
	 
   ####################
   # Start Config
 
   # OSX Defaults
   boxen::osx_defaults { 'Disable Dashboard':
     key    => 'mcx-disabled',
     domain => 'com.apple.dashboard',
     value  => 'YES',
   }
   #boxen::osx_defaults { 'Disable reopen windows when logging back in':
   #  key    => 'TALLogoutSavesState',
   #  domain => 'com.apple.loginwindow',
   #  value  => 'false',
   #}
   #boxen::osx_defaults { 'Disable press-and-hold character picker':
   #  key    => 'ApplePressAndHoldEnabled',
   #  domain => 'NSGlobalDomain',
   #  value  => 'false',
   #}
   boxen::osx_defaults { 'Display full POSIX path as Finder Window':
     key    => '_FXShowPosixPathInTitle',
     domain => 'com.apple.finder',
     value  => 'true',
   }
   boxen::osx_defaults { 'Secure Empty Trash':
     key    => 'EmptyTrashSecurely',
     domain => 'com.apple.finder',
     value  => 'true',
   }
   boxen::osx_defaults { 'Always use current directory in default search':
     key    => 'FXDefaultSearchScope',
     domain => 'com.apple.finder',
     value  => 'SCcf',
   }
   boxen::osx_defaults { 'Do not create .DS_Store':
     key    => 'DSDontWriteNetworkStores',
     domain => 'com.apple.dashboard',
     value  => 'true',
   }
   #boxen::osx_defaults { "Disable 'natural scrolling'":
   #  key    => 'com.apple.swipescrolldirection',
   #  domain => 'NSGlobalDomain',
   #  value  => 'false',
   #}
   boxen::osx_defaults { 'Disable the "Are you sure you want to open this application?" dialog':
     key    => 'LSQuarantine',
     domain => 'com.apple.LaunchServices',
     value  => 'true',
   }
   boxen::osx_defaults { 'fucking sane key repeat':
     domain => 'NSGlobalDomain',
     key    => 'KeyRepeat',
     value  => '0',
   }
   boxen::osx_defaults { 'Expand save panel by default':
       key    => 'NSNavPanelExpandedStateForSaveMode',
       domain => 'NSGlobalDomain',
       value  => 'true',
   }
   boxen::osx_defaults { 'Expand print panel by default':
       key    => 'PMPrintingExpandedStateForPrint',
       domain => 'NSGlobalDomain',
       value  => 'true',
   }
   boxen::osx_defaults { 'Minimize on Double-Click':
       key    => 'AppleMiniaturizeOnDoubleClick',
       domain => 'NSGlobalDomain',
       value  => 'true',
   }
   #boxen::osx_defaults { 'Put my Dock on the left':
   #  key    => 'orientation',
   #  domain => 'com.apple.dock',
   #  value  => 'left',
   #}
   #boxen::osx_defaults { 'Make function keys do real things, and not apple things':
   #  key    => 'com.apple.keyboard.fnState',
   #  domain => 'NSGlobalDomain',
   #  value  => 'true',
   #}
 
   # Disable GateKeeper
   #exec { 'Disable Gatekeeper':
   #  command => 'spctl --master-disable',
   #  unless  => 'spctl --status | grep disabled',
   #}
   
   osx::recovery_message { 'If this Mac is found, please call 07841 757984': }
   include osx::dock::autohide
   include osx::dock::clear_dock
   include osx::finder::unhide_library

   class { 'osx::dock::icon_size': 
     size => 36
   }

   # End Config
   ####################
}
