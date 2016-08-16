#!/bin/sh

. /etc.defaults/rc.subr

KERNELMODULE="soundcore snd-page-alloc snd snd-seq-device snd-rawmidi snd-usbmidi-lib snd-usb-lib snd-hwdep snd-timer snd-pcm snd-usb-audio snd-mixer-oss snd-pcm-oss"
COMPATMODULE="snd-usb-hiface"

case $1 in
	start)
		SYNOLoadModules $KERNELMODULE
		SYNOLoadModules $COMPATMODULE
	;;
	stop)
		SYNOUnloadModules $COMPATMODULE
		SYNOUnloadModules $KERNELMODULE
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

