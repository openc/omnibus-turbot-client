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
  gem "install turbot -n #{install_dir}/sbin --no-ri --no-rdoc"
  gem "install turbot-ruby-gems --no-ri --no-rdoc"
  command %Q{cat << EOF > #{install_dir}/bin/turbot
#!/bin/bash
if [[ \\$(type -P "rvm") ]]; then
  rvm use system do /opt/turbot-client/sbin/turbot "\\$@"
else
  /opt/turbot-client/sbin/turbot "\\$@"
fi
EOF}
  # make it executable
  command "chmod +x #{install_dir}/bin/turbot"

  # Remove docs and headers to save some space
  command "rm -rf #{install_dir}/embedded/lib/ruby/gems/1.9.1/cache"
  command "rm -rf #{install_dir}/embedded/lib/ruby/gems/1.9.1/docs"
  command "rm -rf #{install_dir}/embedded/man"
  command "rm -rf #{install_dir}/embedded/include"
end

# package :deb do
#   vendor 'OpenCorporates <info@opencorporates.com>'
#   license 'MIT'
#   priority 'extra'
#   section 'devel'
# end
