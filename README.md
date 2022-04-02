# The Csound Canonical Reference Manual

[![Build status](https://travis-ci.org/csound/manual.svg?branch=master)](https://travis-ci.org/csound/manual)

The Csound Reference Manual is written using
[DocBook](http://tdg.docbook.org/tdg/4.5/docbook.html) v4. To learn about
DocBook, visit [docbook.org](http://docbook.org).

If you find problems or have suggestions, [open an
issue](https://github.com/csound/manual/issues), or [fork this repository and
make a pull request](https://guides.github.com/activities/forking/).

## Specific Instructions for the Csound Manual

The instructions in the following sections pertain to DocBook generally, not to the Csound manual in particular. To build the Csound manual from source, you will need to adapt the general instructions. Specifically, after making sure that you have installed the necessary tooling and dependencies (as discussed in the following sections), you will need to get the source files for the Csound manual and then run `make` to generate a version of the manual from those source files. The source files include a `Makefile` that you may need to adapt to your configuration. 

If you have installed Csound in `~/csound/csound` and would like to (1) install the Csound manual source in `~/csound/manual` and (2) build an html version in `~/csound/manual/html`, do the following:

```sh
$ cd ~/csound
$ git clone https://github.com/csound/manual.git manual
$ cd manual
$ make html # This assumes that the Makefile will work. If it doesn't, you wll need to edit it and re-run this line.
```

Note: if you are on Ubuntu, the `Makefile` will _not_ work, because it calls Python with `python` and not `python3`. You will need to edit the Makefile so that you call `python3` (the executable name for Python on Ubuntu).

If you followed the above instructions, you will be able to open the manual locally in any web browser with a link like `file:///home/(username)/csound/manual/html/index.html`. 

## General Instructions for Docbook and Related Programs

In addition to other requirements specific to what you’re building, you need
DocBook; [Python](https://www.python.org), with [Pygments](http://pygments.org)
v2.3 or later; and [xsltproc](http://xmlsoft.org/XSLT/xsltproc2.html).

### On Linux

To install DocBook, the required stylesheets, and xsltproc on a Debian-based system (including Ubuntu), run

```sh
sudo apt-get install -y docbook docbook-xsl xsltproc
```

Python is preinstalled on most Linux distributions. If you don’t have Python,
visit https://www.python.org/downloads/ to find instructions for installing Python
or building it from source.

To install Pygments v2.3 or later, run

```sh
sudo pip install 'pygments>=2.3'
```

or, if you don’t have [pip](https://pip.pypa.io/),

```sh
sudo easy_install 'pygments>=2.3'
```

### On macOS

The easiest way to install DocBook is probably through
[Homebrew](https://brew.sh). To install Homebrew, follow the instructions at
https://brew.sh. Then, enter `brew install docbook docbook-xsl` in a Terminal.

To install Pygments v2.3 or later, enter in Terminal

```sh
sudo easy_install 'pygments>=2.3'
```

Python and xsltproc are preinstalled on macOS.

### On Windows

The easiest way to install DocBook is probably through
[Cygwin](https://www.cygwin.com). To install Cygwin, visit
https://www.cygwin.com and download and run an installer for the latest release
of Cygwin.

To install Python, visit https://www.python.org/downloads/windows/ and download
and run an installer for the latest release of Python 2.7. Make sure you add
python.exe to your Windows Path when you install Python.

Visit http://pygments.org/download/ to learn how to install Pygments.


## Building

Run `make ⟨target⟩` to build a `⟨target⟩`. For example, to build a collection of
HTML webpages, run `make html`.

You may see this error: “The XSL_BASE_PATH variable must be set to the XSL
stylesheets installation directory.” To tell `make` where to find DocBook XSL
stylesheets, run

```sh
make XSL_BASE_PATH=path/to/docbook/stylesheets ⟨target⟩
```

instead of `make ⟨target⟩`. For example, on macOS run

```sh
make XSL_BASE_PATH="$(brew --prefix docbook-xsl)/docbook-xsl" ⟨target⟩
```

If you see an error message that `CsoundDocumentLexer` isn’t found when you try
to build a `⟨target⟩`, then you’re probably using Pygments v2.0.2 or earlier,
and you need [Pygments v2.3 or later](#general-requirements).

### HTML

Run `make html` (or just `make`) to create a folder named html containing a
collection of HTML files.


### PDF

In addition to the [general requirements](#general-requirements), building PDF
files requires [Apache FOP](https://xmlgraphics.apache.org/fop/). You may also
need to download and install a [Java Runtime
Environment](http://www.oracle.com/technetwork/java/javase/downloads/jre8-downloads-2133155.html).

To install FOP on Linux, run

```sh
sudo apt-get install -y fop
```

To install FOP on macOS using [Homebrew](https://brew.sh), run

```sh
brew install fop
```

Run `make pdf` to create a PDF file suitable for printing on [letter
paper](https://en.wikipedia.org/wiki/Letter_(paper_size)).

Run `make pdfA4` to create a PDF file suitable for printing on [A4
paper](https://en.wikipedia.org/wiki/ISO_216#A_series).


### Compiled HTML Help

You can only build [Compiled HTML
Help](https://en.wikipedia.org/wiki/Microsoft_Compiled_HTML_Help) on Windows. In
addition to the [general requirements](#general-requirements), building Compiled
HTML Help requires HTML Help Workshop. To install HTML Help Workshop, visit
https://go.microsoft.com/fwlink/?LinkId=14188 to download htmlhelp.exe, and then
double-click htmlhelp.exe.

Run `make htmlhelp` to create a Compiled HTML Help (.chm) file.


## Editing the Manual

DocBook is [XML](https://en.wikipedia.org/wiki/XML). When you write XML,
remember to close tags. This is valid XML:

```xml
<para>text</para>
```

This isn’t:

```xml
<para>text</ERROR>
```

DocBook v4 has a [document type definition
(DTD)](http://docbook.org/xml/4.5/) that describes valid DocBook elements and
attributes. See [_DocBook: The Definitive
Guide_](http://tdg.docbook.org/tdg/4.5/docbook.html) to learn more.


### Adding an Opcode Entry

In general, an entry for a new opcode named `newopcodename` will be an XML
file named newopcodename.xml containing

```xml
<refentry id="newopcodename">
    <!-- More mark-up… -->
</refentry>
```

One way to get started documenting your opcode is to use an existing entry as a
template. All opcode entries are in the [opcodes folder](opcodes). You can also
use [opcodes/templates.xml](opcodes/template.xml) as a starting point.

To incorporate a new entry into the manual:

1. Add the entry as an entity in [manual.xml](manual.xml). For example, if you
put newopcodename.xml in the opcodes folder, add this entity to manual.xml:

    ```xml
    <!ENTITY opcodesnewopcodename SYSTEM "opcodes/newopcodename.xml">
    ```

2. Use the entity to add your opcode entry to
[opcodes/top.xml](opcodes/top.xml). Opcode entries are arranged alphabetically,
so just find where your opcode should be in the list and add:

    ```xml
    &opcodesnewopcodename;
    ```

3. Link to your opcode entry from an appropriate section of the manual. For
example, if `newopcodename` should be included with realtime spectral processing
opcodes, add a [`link` element](http://tdg.docbook.org/tdg/4.5/link.html) to
[spectral/realtime.xml](spectral/realtime.xml), like this:

    ```xml
    <link linkend="newopcodename"><citetitle>newopcodename</citetitle></link>
    ```

    Repeat this step for each section in which you think your opcode should be
included.

4. Optionally, use a [`refentryinfo`
element](https://github.com/csound/manual/search?q=refentryinfo+path%3Aopcodes+filename%3Atemplate.xml)
so your opcode will be properly categorized in the [Quick
Reference](https://csound.github.io/docs/manual/MiscQuickref.html). Use one of
the categories in [categories.py](categories.py). (If you omit a `refentryinfo`
element, your opcode will be categorized as
[Miscellaneous](https://github.com/csound/manual/search?q=Miscellaneous+filename%3Acategories.py).)

5. If possible, add a [`link` element](http://tdg.docbook.org/tdg/4.5/link.html)
to your opcode in the appropriate section of the [Opcodes
Overview](https://csound.github.io/docs/manual/PartOpcodesOverview.html).


## For Maintainers

There are several targets that prepare files for release. Remember to update
Csound’s version number in
[manual.xml](https://github.com/csound/manual/search?q=csoundversion+filename%3Amanual.xml)
and the
[Makefile](https://github.com/csound/manual/search?q=VERSION+filename%3AMakefile)
so that files are generated with that number. It’s also a good idea to update
the [What's new…](preface/whatsnew.xml) section for each release.
