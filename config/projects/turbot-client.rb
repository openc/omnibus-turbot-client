name 'turbot-client'
maintainer 'CHANGE ME'
homepage 'https://CHANGE-ME.com'

install_dir     '/opt/turbot-client'
build_version   Omnibus::BuildVersion.semver
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
