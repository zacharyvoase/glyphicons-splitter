# glyphicon splitter

I needed individual [Glyphicons][] in vector format for an upcoming
presentation, so I built a little toolchain with Python, PhantomJS and Make to
extract individual icons from the `glyphicons.svg` file you get when you [buy
the ‘PRO’ package][full-glyphicons].

  [glyphicons]: http://glyphicons.com/
  [full-glyphicons]: http://pul.ly/b/12171


## instructions

You need Python, Cairo, PhantomJS and Make installed on your system. I ran this
on a Mac; your mileage may vary on other operating systems.

Install the necessary Python dependencies:

    pip install -r requirements.txt

This will install lxml, cssselect and PyCairo. On my computer (running OS X
Mountain Lion), I actually installed `py2cairo` from Homebrew, and pointed to
it from the `PYTHONPATH` variable (see the `Makefile`). The `cairosvg` binary
from pycairo must be on your `PATH` for this to work, too.

You then need to take the `glyphicons.svg` file from
`glyphicons_pro/glyphicons/svg` (which you can download when you buy it) and
move/copy it into this directory. It will only be read, not written, so you can
even symlink it.

The next step is to simply run `make`; this will leave individual SVGs in the
`extracted/` directory (because individual SVGs have been extracted from the
large SVG file) and individual PDFs in the `rendered/` directory (because those
PDFs were rendered from the extracted SVGs). Enjoy, and pull requests/bug
reports are welcome!


## (un)license

**N.B.**: The Glyphicon icons themselves are released under their own license;
this covers the software I've written and added to this repo **only**.

This is free and unencumbered software released into the public domain.

Anyone is free to copy, modify, publish, use, compile, sell, or
distribute this software, either in source code form or as a compiled
binary, for any purpose, commercial or non-commercial, and by any
means.

In jurisdictions that recognize copyright laws, the author or authors
of this software dedicate any and all copyright interest in the
software to the public domain. We make this dedication for the benefit
of the public at large and to the detriment of our heirs and
successors. We intend this dedication to be an overt act of
relinquishment in perpetuity of all present and future rights to this
software under copyright law.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.

For more information, please refer to <http://unlicense.org/>
