#!/bin/sh

. /etc.defaults/rc.subr

# Debian chroot package
CHROOT_DIR="/usr/local/debian-chroot"
CHROOTTARGET=`realpath ${CHROOT_DIR}/var/chroottarget`

case $1 in
	start)
		chroot ${CHROOTTARGET} /etc/init.d/mpd start
		chroot ${CHROOTTARGET} /etc/init.d/mpdscribble start
	;;
	stop)
		chroot ${CHROOTTARGET} /etc/init.d/mpdscribble stop
		chroot ${CHROOTTARGET} /etc/init.d/mpd stop
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

