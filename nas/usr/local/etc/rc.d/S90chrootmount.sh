#!/bin/sh

. /etc.defaults/rc.subr

CHROOTDIR=/var/packages/debian-chroot/target/var/chroottarget/media
MEDIADIR=/volume1/media

case $1 in
	start)
		mount -o bind $MEDIADIR $CHROOTDIR
	;;
	stop)
		umount $CHROOTDIR
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


