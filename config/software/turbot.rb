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

build do
  gem "install turbot -n #{install_dir}/bin"
end

package :deb do
  vendor 'OpenCorporates <info@opencorporates.com>'
  license 'MIT'
  priority 'extra'
  section 'devel'
end
