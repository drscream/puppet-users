class users {
	define newuser( $username = $title, $realname, $key, $keytype ) {
		user {
			"$username":
				ensure => present,
				comment => "$realname",
				managehome => true,
				gid => "users",
				groups => ["adm", "staff", "sudo"],
				shell => "/bin/bash",
				password => "*"
		}
		ssh_authorized_key {
			"$username":
				ensure => 'present',
				key    => "$key",
				type   => "$keytype",
				user   => "$username"
		}
	}
}
