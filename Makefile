PARALLEL = 4

# This is where py2cairo was installed on my Mac; YMMV.
export PYTHONPATH:=/usr/local/lib/python2.7/site-packages:${PYTHONPATH}

# Default target: this will extract all individual SVGs and render them as
# individual PDFs.
render-all: extracted/4square.svg
	ls extracted/*.svg | sed 's/^extracted/rendered/;s/svg$$/pdf/' | xargs -P $(PARALLEL) $(MAKE)

clean:
	rm -Rf extracted rendered bounding_boxes.json

glyphicons.pdf: glyphicons.svg
	cairosvg glyphicons.svg --format=pdf --dpi=300 --output=glyphicons.pdf

bounding_boxes.json: get_bounding_boxes.js glyphicons.svg
	phantomjs get_bounding_boxes.js glyphicons.svg > bounding_boxes.json

extracted:
	mkdir -p extracted

extracted/4square.svg: extracted bounding_boxes.json
	./extract_icons.py glyphicons.svg bounding_boxes.json extracted

rendered:
	mkdir -p rendered

rendered/%.pdf: extracted/%.svg rendered
	cairosvg $< --format=pdf --output=$@

.PHONY: render-all clean
