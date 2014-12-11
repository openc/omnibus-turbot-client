name 'turbot-client'
maintainer 'OpenCorporates'
homepage 'https://opencorporates.com'

install_dir     '/opt/turbot-client'
build_version   '0.1.4'
build_iteration 1

# creates required build directories
dependency 'preparation'

# turbot-client dependencies/components
# dependency 'somedep'

# version manifest file
dependency 'version-manifest'
dependency "turbot"
exclude '\.git*'
exclude 'bundler\/git'
