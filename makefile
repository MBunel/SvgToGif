SVG_FILES := $(wildcard *.svg)
PNG_FILES := $(SVG_FILES:.svg=.png)
EXEC := Map

all: $(EXEC)

%.png: %.svg
	inkscape -z $< -e $@

Map: $(PNG_FILES)
	convert -delay 20 -loop 0 $(PNG_FILES) $@.gif

clean:
	rm -f *.png
	rm -f *.gif

mrproper: clean
