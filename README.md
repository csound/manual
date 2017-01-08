# About the Manual 

The Csound Reference Manual is written in Docbook-XML. More information about
Docbook-XML can be found at the following links:

http://docbook.org/
http://www.sagehill.net/book-description.html

If you find problems or have suggestions, please report them on the csound
developer mailing list.


# Building the Manual

To build the manual, a number of different tools are required, depending on 
what target output is desired. All targets require xsltproc and the Docbook
XML DTDs to be installed and findable by xsltproc. The Docbook XSL stylesheets
have to be installed too. The location of the stylesheets can be noted via the
XSL_BASE_PATH variable:

    $ make XSL_BASE_PATH=path/to/xsl/installation <target>

The default is /usr/share/xml/docbook/stylesheet/nwalsh/

On Linux, most distributions include these programs, or are available on 
packaging repositories for the respective distribution.

For Windows, xsltproc can be found as part of the Cygwin environment
(http://www.cywgin.com). A natively compiled version for windows can be found
at:

http://zlatkovic.com/libxml.en.html

Mac OS 10.5 (leopard) includes xsltproc.

(NOTE: If someone works on OSX or OS9 and finds xsltproc for these platforms 
or another suitable XSLT processor, please update this documentation.)


The manual is made using make with the included Makefile. For example to make 
the html (canonical) version:

    $ make html

is all that is needed.

To begin a new build, use

    $ make clean

Other targets include pdf, pdfA4 and htmlXO. See the makefile for distribution
and other targets.


## HTML 

Use:

    $ make html

Requires: Python (to generate the frames version, and to update the Quick
          Reference)


## PDF 

Use:

    $ make pdf

or

    $ make pdfA4

Requires: 

* Apache FOP (http://xmlgraphics.apache.org/fop/)
* Java Advanced Imaging Library (https://jai.dev.java.net/binary-builds.html)
* A Java Runtime Environment to run the above

FOP can require a lot of memory, so it is recommended to edit the fop.sh file 
and add "-Xmx384m" to the last line, so it reads as such:

    $ JAVACMD -Xmx384m -classpath "$LOCALCLASSPATH" $FOP_OPTS org.apache.fop.apps.Fop "$@"

This increases the max ram the VM can use to 384megs, which you'll need 
for FOP to run as the manual is fairly large.


## HTMLHELP 

Use:

    $ make htmlhelp

Requires: Microsoft HTML Help Workshop
              (http://msdn.microsoft.com/library/default.asp?url=/library/en-us/htmlhelp/html/hwMicrosoftHTMLHelpDownloads.asp)

This target compiles a Windows .chm file, a format that replaced WinHelp.


# Editing the Manual

## Modifying an Entry

In general, be careful to be mindful that these files are XML and must be valid.
All tags that are openned must be closed, i.e. <para>My Information</para>.

Also, Docbook-XML has a DTD that describes what is well-formed for the document,
meaning that certain tags only allow other tags within it.  For more information
on valid Docbook tags, see "Docbook: The Definitive Guide" by Norm Walsh, 
available at http://docbook.org/.


## Adding an Opcode Entry 

First, the best place to start is to take an existing entry and use that as a 
template. All opcode entries are organized in the opcodes folder.
You can base your entry on an existing entry, or use Opcodes/templates.xml.

To incorporate a new entry into the manual, a few things are required.

1. Add the entry as an entity in manual.xml.  For example, if you put 
the myOpcodeEntry.xml in the opcodes directory, then this entry should be 
the one to add in manual.xml:

    <!ENTITY opcodesmyopcodeentry SYSTEM "opcodes/myOpcodeEntry.xml">

2. Add the entry to opcodes/top.xml by using the entity.  This will actually add 
the entry to the reference manual.  The entries are alphabetically ordered, so 
just find where your opcode should be in the list and add:

    &opcodesmyopcodeentry;

The above uses the entity that was defined in the manual.xml file (think of it 
like an #include).

3. After that, you'll probably want to find the section headers where the 
opcode should be cross-referenced from.  For example, if myOpcodeEntry should 
be categorized with other pvs opcodes in spectral/realtime.xml, it would be
added in that file as:
    
    <link linkend="myOpcodeEntry"><citetitle>My Opcode Entry</citetitle></link>

The linkend attribute above points to a docbook ID.  The "myOpcodeEntry" ID 
should be defined in the myOpcodeEntry.xml, probably to be done at the top 
level like this:

    <refentry id="myOpcodeEntry">

Repeat step 3 for any sections you think this opcode should be 
categorized in.

4. Add the appropriate info tag so the opcode will be properly categorized in
the Quick Reference. If no info tag is provided the opcode will appear in 
'Miscellaneous'. Consult available categories in quickref.py.

5. If possible reference the opcode in the appropriate section in Section II of
the manual, and add the necessary cross references.

6. For transforming the myOpcodeEntry.csd example file to myOpcodeEntry.csd.xml
(in examples-xml), use the csd2docbook.py or csd2docbook2.py script. The former
uses the Csound API for an opcode list, while the latter uses a file 
opcode_list.txt (which is similar to the result of the command 'csound -z').
For instance: $ python csd2docbook2.py -f genarray_i.csd will create the file
genarray_i.csd.xml from genarray_i.csd for use in the genarray_i opcode entry.


# For Maintainers 

There are several targets that prepare files for release. It is important to
remember to change the version number so that files and content are generated 
with that number. It must be changed both in manual.xml and the Makefile.
It is also a good idea to update the What's new section for each release.

## General XML Editing Tips

* The "<" and ">" symbol, when used as text within XML tags, need to be escaped. The corresponding entities to use are "&lt;" and "&gt;".
* The refsect1 tag ends with the number 1, not the letter l.
* You can test your XML file by opening it in a web browser (i.e. Firefox, 
Mozilla, Internet Explorer, etc.).  Most browsers will display the XML file if
it is correct or will give you an error message if it the XML file is not valid,
as well as give you information on where it is in error.

Using a dedicated XML editor takes some of the pain out of editing the manual.
Something like emacs in sgml mode or Kate in XML mode are very helpful.

