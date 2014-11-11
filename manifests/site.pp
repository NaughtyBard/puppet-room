class latest_kernel {
    package { ['kernel', 'kernel-devel', 'kernel-tools' ]:
        ensure => latest,
    }
}

class vimrc {
    notify{"Adding vim config file...":}
    file {"/root/.vimrc":
        ensure => present,
        owner => "root",
        group => "root",
        mode => 644,
        content => "set smartindent\nset tabstop=4\nset shiftwidth=4\nset expandtab",
    }
    notify{"vim config file added":}    
}

node default {
    include latest_kernel
    include vimrc
}
