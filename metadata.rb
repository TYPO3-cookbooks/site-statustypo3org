name             "site-statustypo3org"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Installs/Configures status.typo3.org"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          IO.read(File.join(File.dirname(__FILE__), 'VERSION')) rescue '0.0.1'

depends          "t3-base",   "~> 0.2.66"

depends          "t3-zabbix", "~> 1.0.0"
depends          "t3-mysql",  "~> 0.1.0"

depends          "database",  "= 1.3.12"
depends          "php",       "= 5.1.0"

# Make sure to freeze all versions of community cookbooks here!
depends "apache2", "= 4.0.0"
depends "chef-sugar", "= 4.1.0"
depends "dmg", "= 4.1.1"
depends "firewall", "= 2.6.5"
depends "git", "= 4.2.4"
depends "iptables", "= 4.3.4"
depends "omnibus_updater", "= 1.1.0"
depends "packagecloud", "= 1.0.0"
depends "runit", "= 3.0.6"
depends "ssl_certificates", "= 1.1.3"
depends "windows", "= 5.0.0"
