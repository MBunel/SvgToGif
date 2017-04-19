EXEC := Map

SVG_FILES := $(wildcard *.svg)
PNG_FILES := $(SVG_FILES:.svg=.png)

GIFC := convert
GFLAGS := -delay 20 -loop 0

all: $(EXEC)

%.png: %.svg
	inkscape -z $< -e $@

Map: $(PNG_FILES)
	$(GIFC) $(GFLAGS) $(PNG_FILES) $@.gif

clean:
	rm -f *.png

mrproper: clean
	rm -f $(EXEC).gif
