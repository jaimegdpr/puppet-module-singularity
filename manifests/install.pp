# Private class.
class singularity::install {
    assert_private()

    if $::osfamily == 'RedHat' {
        if $::singularity::manage_osg_repo {
            if $::operatingsystemmajrelease == '6' {

                yumrepo { "osg":
                    name => "osg",
                    descr => "OSG Software for Enterprise Linux 6 - $basearch",
                    mirrorlist => "http://repo.grid.iu.edu/mirror/osg/3.4/el6/release/$basearch",
                    failovermethod => priority,
                    enabled => 1,
                    priority => 98,
                    gpgcheck => 1,
                    gpgkey => 'http://repo.grid.iu.edu/osg/3.4/RPM-GPG-KEY-OSG',
                    before => Package['singularity'],
                }

            } elsif $::operatingsystemmajrelease == '7' {

                yumrepo { "osg":
                    name => "osg",
                    descr => "OSG Software for Enterprise Linux 7 - $basearch",
                    mirrorlist => "http://repo.grid.iu.edu/mirror/osg/3.4/el7/release/$basearch",
                    failovermethod => priority,
                    enabled => 1,
                    priority => 98,
                    gpgcheck => 1,
                    gpgkey => 'http://repo.grid.iu.edu/osg/3.4/RPM-GPG-KEY-OSG',
                    before => Package['singularity'],
                }
            }
        }

        #Check if it is needed to manage this package
        ensure_packages(['yum-plugin-priorities'], { ensure => 'present', 
                                                     before => Package['singularity']}
                       )

        package {'singularity':
            ensure => $::singularity::package_ensure,
            name   => $::singularity::package_name,
        }
    }
}
