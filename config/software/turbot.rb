# This is an example software definition for a Ruby project.
#
# Lots of software definitions for popular open source software
# already exist in `opscode-omnibus`:
#
#  https://github.com/opscode/omnibus-software/tree/master/config/software
#
name "turbot"
default_version "1.0.0"

dependency "ruby"
dependency "rubygems"
dependency "bundler"
dependency "sqlite3"
dependency "nokogiri"

build do
  gem "install turbot -n #{install_dir}/sbin"
  gem "install turbot-ruby-gems"
  command %Q{cat << EOF > #{install_dir}/bin/turbot
#!/bin/bash
if [[ $(type -P "rvm") ]]; then
  rvm use system do /opt/turbot-client/sbin/turbot "$@"
else
  /opt/turbot-client/sbin/turbot "$@"
fi
EOF}
  # make it executable
  command "chmod +x #{install_dir}/bin/turbot"
end

# package :deb do
#   vendor 'OpenCorporates <info@opencorporates.com>'
#   license 'MIT'
#   priority 'extra'
#   section 'devel'
# end
