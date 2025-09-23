This is the develop branch of the Csound Reference Manual for Csound7.xx.  

It uses [MkDocs-material](https://squidfunk.github.io/mkdocs-material/)  

## Local editing and building of the manual

To work locally on the manual you have to:

1. Install [git](https://git-scm.com/) on your computer.
2. Clone the manual repository: `git clone https://github.com/csound/manual`
3. Install [python](https://www.python.org/) on your computer.
4. Install mkdocs-material on your computer: `pip install mkdocs-material`

### Editing the manual

The manual is written using markdown in md files. A good reference for markdown in GitHub is [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax).

It is recommanded to use a good text editor for writing md files. [Visual Studio Code](https://code.visualstudio.com/) is particularly convenient for this task.

If you want to see local changes, run `mkdocs serve` in the doc directory. The site is then visible under `localhost:8000` in your browser.

### Building the manual

Each time some changes are committed on GitHub, a Continous Integration (CI) Action is launched on the manual GitHub repository and in a few minutes the result can be seen online [here](https://csound.com/manual/).

Local versions of the manual can be built in two ways:

1. Build a static version of the manual which can be seen in your browser by opening the file *index.html* which is in the directory specified by the -d flag of the build command. For example:

    `OFFLINE=true mkdocs build -d ../csound7-manual-local`

2. Build a static version of the manual which can be served by a local server taking its root in the directory specified by the -d flag of the build command. For example:

    `mkdocs build -d ../csound7-manual-serve`

The second case could be used in a classroom with a local wifi network. The teacher could start a local server on her computer like this:

```
cd path_to_csound7-manual-serve
python -m http.server
```

Then, if the teacher machine got IP address 192.168.1.19 for example, each student could reach the manual from her browser using the URL `http://192.168.1.19:8000/`

### Writing an opcode notice

Here is an example of a notice written in markdown for an opcode named 'myopcode':

~~~markdown
<!--
id:opcodeId
category:opcodeCategory
-->
# Myopcode

One-line description of myopcode.

Eventually complementary and detailed description.

## Syntax

=== "Modern"
``` csound-orc
     res:type =  myopcode(arg1:type, ...)
```

=== "Classic"
``` csound-orc
    res myopcode arg1, ...
```

### Initialization

List and describe init-time arguments.

### Performance

List and describe perf-time arguments.

Eventually describe performance in detail.

An internal relative link is like this: see [GEN01](../scoregens/gen01.md) where our myopcode notice is in the directory 'opcodes' and the GEN01 notice is in the directory 'scoregens' at the same level of the directory 'opcodes'. A link to another opcode within the same 'opcodes' directory would be: [anotherOpcode](anotherOpcode.md).

An image can be inserted like this:

<figure markdown="span">
![Image Title.](../images/imagefilename.png)
<figcaption>Image Title.</figcaption>
</figure>

## Examples

Here is an example of the myopcode opcode. It uses the file [myopcode.csd](../examples/myopcode.csd).

``` csound-csd title="Example of the myopcode opcode." linenums="1"
--8<-- "examples/myopcode.csd"
```

Eventually some comments and/or

```
literal output of the example
```

## See also

[myopcode category header](../somecategory/top.md)

## Credits

Authors: John Dee<br>
April 2025<br>

New in Csound Version 7.xx

~~~

The html comment at the top is mandatory to define an id for the opcode and a category. The id is not used at the moment but it is there for an eventual future use. The category is one of the categories listed in the file 'categories.py' or a new one. If it is a new one, you have to add it in the file 'categories.py'.

The one-line description of the opcode is mandatory. Don't forget the ending dot character!

Paragraphs are separated by a blank line. Avoid line breaks within a paragraph.

Markdown allows line breaks by including two blank spaces at the end of the line. As blank spaces are note visible in a text editor, we prefer to use the html tag `<br>`.

When enclosing a block of code with backticks, one can ask for syntax highlighting:

~~~ markdown
``` csound-orc title="some title" linenum="1"
   some code
```
~~~

or

~~~ markdown
``` csound-sco
   some code
```
~~~

or

~~~ markdown
``` csound-csd
   some code
```
~~~

The title and linenums attributes are facultative.

A note is written like this:

~~~ markdown
> :memo: **Note Title**
>
> Blabla
> Blabla
~~~

A warning is written like this:

~~~ markdown
> :warning: **Warning Title**
>
> Blabla
> Blabla
~~~

Examples of all these features can be seen in the existing opcodes notices.

Once an opcode notice is in the 'opcodes' directory, running the command `python makeAppendices.py` from the 'manual' directory will automatically update the reference and index files:

```
reference\opcodesReference.md
opcodesIndex.md
opcodesQuickRef.md
misc/examples.md
```

The author can also add a link to its opcode notice in one of the category notices.

