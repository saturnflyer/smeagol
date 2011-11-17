#
# Cookbook Name:: homebrew
# Recipe:: dbs
#

root = File.expand_path(File.join(File.dirname(__FILE__), ".."))

require root + '/resources/homebrew'
require root + '/providers/homebrew'

%w(tig ack coreutils imagemagick sqlite wget fortune proctools markdown ctags-exuberant gpgme icu4c wget).each do |pkg|
  homebrew pkg
end

homebrew "tmux"
template "#{ENV['HOME']}/.tmux.conf" do
  mode   0700
  owner  ENV['USER']
  group  Etc.getgrgid(Process.gid).name
  source "dot.tmux.conf.erb"
  variables({ :home => ENV['HOME'] })
end

