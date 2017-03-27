#
# Kubler phase 1 config, pick installed packages and/or customize the build
#
_packages="mail-mta/opensmtpd"

#
# This hook is called just before starting the build of the root fs
#
configure_rootfs_build()
{
    :
}

#
# This hook is called just before packaging the root fs tar ball, ideal for any post-install tasks, clean up, etc
#
finish_rootfs_build()
{
    sed -i 's/listen on localhost/listen on 0.0.0.0/g' "${_EMERGE_ROOT}"/etc/opensmtpd/smtpd.conf
    mkdir "${_EMERGE_ROOT}"/run
}
