#a manifest to install a package
package { 'flask':
ensure   => '2.1.0',
name     => 'flask',
provider => 'pip3',
}
