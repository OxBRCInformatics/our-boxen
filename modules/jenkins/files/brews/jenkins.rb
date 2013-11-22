require 'formula'

class Jenkins < Formula
  homepage 'http://jenkins-ci.org'
  url 'http://mirrors.jenkins-ci.org/war/1.502/jenkins.war'
  sha1 '450b8bd2efb7cd3154681a767243ffd8807199bf'
  version '1.502-boxen1'

  skip_clean :all

  def install
    libexec.install "jenkins.war"
  end

end
