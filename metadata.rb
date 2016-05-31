name             "site-statustypo3org"
maintainer       "TYPO3 Association"
maintainer_email "steffen.gebert@typo3.org"
license          "Apache 2.0"
description      "Installs/Configures status.typo3.org"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version "0.0.5"

depends "t3-base", "~> 0.2.0"

depends "ssl_certificates"
depends "php"
depends "apache2"
