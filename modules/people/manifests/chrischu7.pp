class people::chrischu7 {
  
  # Standard applications
  include chrome
  include firefox
  include vlc
  include postgresql
  include mysql
  include mysql_workbench
  include cyberduck

  include skype
  include dropbox
  include alfred
 
  include intellij
  include eclipse::java
  include netbeans
  include textmate::textmate2::beta
  
  include jenkins

  include hipchat
  include groovy

  # Personal preference 
  include onepassword
  include zsh
  include iterm2::dev
  include virtualbox
  include vagrant
  

   
  include mongodb
  #include adobe_reader
  #include emacs
  #include spotify
  include gimp


  #maybe should include
  #macvim
  #matlab
  #github for Mac 181
  
  
  $nodejs_modules = [
    'coffee-script',
    'express',
    'jade',
    'mongojs',
    'stylus',
    'karma',
    'bower',
    'travis',
    'yo',
    'grunt'
  ]
  nodejs::module { $nodejs_modules :
    node_version => 'v0.10',
    ensure       => installed,
  }

  
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
      'vimrc.after',
      'zshrc',
      'zshenv'
    ],
    packages => {
      brew   => [
        'bash',
        'wget',
        'gpg2',
        'tmux',
        'smartypants',
        'multimarkdown',
        'freetype',
        'gitflow',
        'bash-completion',
        'maven',
        'sonar',
        'rabbitmq'
      ],
      gem    => [
      'heroku'
      ],
    }
  }
 
  # Install Brew Applications
  package { $env['packages']['brew']:
    provider => 'homebrew',
  }
  
  # Dotfile Setup
  repository { 'chrischu7-dotfiles':
    source  => 'chrischu7/dotfiles',
    path    => "${env['directories']['dotfiles']}",
  }

  ### This really should be a shell script. DO IT!
  -> people::chrischu7::dotfile::link { $env['dotfiles']:
    source_dir => $env['directories']['dotfiles'],
    dest_dir   => $env['directories']['home'],
  }
 
  repository { 'oh-my-zsh':
     source => 'chrischu7/oh-my-zsh',
     path   => "/Users/${::luser}/.oh-my-zsh"
  }
 
  # Misc Helpers until I can figure out where to put this
  define dotfile::link($source_dir, $dest_dir) {
    file { "${dest_dir}/.${name}":
      ensure => symlink,
      target => "${source_dir}/${name}",
    }
  }

  git::config::global {
    'alias.st':   value => 'status';
    'alias.ci':   value => 'commit';
    'alias.co':   value => 'checkout';
    'alias.di':   value => 'diff';
    'alias.dc':   value => 'diff --cached';
    'alias.lp':   value => 'log -p';
    'color.ui':   value => 'true';
    'user.name':  value => 'Christian Schusterreiter';
    'user.email': value => 'christian.schusterreiter@gmail.com';
  }


   
   ####################
   # Start OSX Config
 
   # Sane Defaults
   #Boxen::Osx_defaults {
   #  user => $::luser,
   #}
 
   # OSX Defaults
   boxen::osx_defaults { 'Disable Dashboard':
     key    => 'mcx-disabled',
     domain => 'com.apple.dashboard',
     value  => 'YES',
   }
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

   osx::recovery_message { 'If this Mac is found, please call 07841 757984': }
   include osx::dock::autohide
   include osx::dock::clear_dock
   include osx::finder::unhide_library

   class { 'osx::dock::icon_size': 
     size => 36
   }
}
