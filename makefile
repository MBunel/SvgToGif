EXEC := animation

SVG_FILES := $(wildcard *.svg)
PNG_FILES := $(SVG_FILES:.svg=.png)

SVGC := inkscape
SFLAGS:=

GIFC := convert
GFLAGS := -delay 20 -loop 0

all: $(EXEC)

%.png: %.svg
	$(SVGC) -z $< -e $@ $(SFLAGS)

animation: $(PNG_FILES)
	$(GIFC) $(PNG_FILES) $@.gif $(GFLAGS)

clean:
	rm -f *.png

mrproper: clean
	rm -f $(EXEC).gif
