EXEC := animation

SVG_FILES := $(wildcard *.svg)
PNG_FILES := $(SVG_FILES:.svg=.png)
PNG_FILES_ORDER := $(sort $(PNG_FILES))

SVGC := inkscape
SFLAGS:=

GIFC := convert
GFLAGS := -delay 20 -loop 0

all: $(EXEC)

%.png: %.svg
	$(SVGC) $(SFLAGS) -z $< -e $@

animation: $(PNG_FILES)
	$(GIFC) $(GFLAGS) $(PNG_FILES_ORDER) $@.gif

clean:
	rm -f *.png

mrproper: clean
	rm -f $(EXEC).gif
