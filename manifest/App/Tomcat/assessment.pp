# class is nothing more rhan path or location where hostrole file is actually exist.
Here class this hostrole is for application:: that belongs to tomcat::in production environment::application name per supose assesment.
class hostroles::app::Tomcat::production::assesment.pp
# this is a case statment where we are giving specific host name to get changes into that specific server via puppet
  case $::hostname {
    '<server name>': {
      firewall { 'allowing https port':
        port   => [443],
        proto  => https,
        action => accept,
        ensure => started,
      }
      class { 'apache': # using apache module here to srever web page
        apache::vhost { 'example.com':  # "apache::vhost" will be an another repository where all configs will be kept to serve.
          file   {'/var/www/html':
          source 'vhost'
          port    => '80',
          owner   => 'root',
          }
        }
      }
      sslcertificate { "Install-Intermediate-Certificate" : ## self sign certificate
        name       => 'go_daddy', # example name
        location   => '<path>',
        store_dir  => '<dir>',
        root_store => 'LocalMachine',
        thumbprint => '<key>'
      }
      monitoring::service { "newrelic":
        accessid     => '<>',
        accesskey    => '<>',
        rpmAutoStart => true,
      }

  }
# above case statment is to open specific port, which we are using fire wall module.
 ***
 ***
 ***
#Content below here should be located on another repository where we will keep all content dependancy files
class::apache::vhost

##Vhost file

<html>
<head>
<title>hellow world!</title>
<head/>
<body>
<h1>Hellow world!</h1>
</body>
</html>
