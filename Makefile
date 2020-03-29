OPTIONS = -Wl -D -Wl __STACKSTART__=\$$7D00
START_ADDR = 0x1000

all: leds.bin

leds.bin: leds.s
	cl65 --cpu 65816 -t none ${OPTIONS} -o $@ -m $(@:.bin=.map) -l $(@:.bin=.lst) $^

clean:
	rm -f leds.bin leds.lst leds.map

program: leds.bin
	./wdcmon.py program ${START_ADDR} leds.bin --verify

run: program
	./wdcmon.py run ${START_ADDR}

.PHONY: all clean program run
