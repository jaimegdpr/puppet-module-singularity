class singularity::mount {

    file {'/etc/cvmfs/SITECONF':
        ensure => directory,
#        owner => 'root',
#        group => 'root',
#        mode => '0755',
        before => Mount['/etc/cvmfs/SITECONF'],
    }

    mount {'/etc/cvmfs/SITECONF':
        ensure => mounted,
#        device => 'gaesto02.ciemat.es:/pool/gaesto01/cms/SITECONF/local',
        device => 'gaesto02.ciemat.es:/pool/gaesto01/cms/SITECONF_singularity/local',
        fstype => 'nfs',
        options =>'ro,intr,noatime,soft,rsize=8192,wsize=8192,actimeo=600,timeo=50,retrans=4',
    }

}
