#a manifest to install a package
package { 'flask':
name     => 'flask',
ensure   => '2.1.0',
provider => 'pip3',
}