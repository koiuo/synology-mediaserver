#!/bin/sh

. /etc.defaults/rc.subr

# Debian chroot package
CHROOT_DIR="/usr/local/debian-chroot"
CHROOTTARGET=`realpath ${CHROOT_DIR}/var/chroottarget`

case $1 in
	start)
		chroot ${CHROOTTARGET} /etc/init.d/dbus start
		chroot ${CHROOTTARGET} /etc/init.d/avahi-daemon start
	;;
	stop)
		chroot ${CHROOTTARGET} /etc/init.d/avahi-daemon stop
		chroot ${CHROOTTARGET} /etc/init.d/dbus stop
	;;
	restart)
		$0 stop
		sleep 1
		$0 start
	;;
	*)
		echo "Usage: $0 start|stop|restart"
	;;
esac

