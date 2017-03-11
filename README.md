# Paru filter collection

A collection of [pandoc](http://pandoc.org/) filters written in
[Ruby](https://www.ruby-lang.org/en/) and
[paru](https://heerdebeer.org/Software/markdown/paru/).

## Contents

- [paru-insert.rb](#paru-insertrb), inserting other pandoc markdown files
- [paru-code.rb](#paru-coderb), inserting source code files in a code block
- [paru-screenshot.rb](#paru-screenshotrb), automatically take
  screenshot of a web page and insert in markdown file

## paru-insert.rb

Inserts other pandoc markdown files. 

Note. The current version of the filter does not work recursively. If an
inserted file contains a `::paru::insert` command as well, that will not be
executed but will appear verbatim in the output.

### Example

    When writing a paper, it makes sense to put section in separte files and
    then include them. We explain this process in the following sections:

    ### On including other files

    ::paru::insert path/to/other/pandoc/markdown/file

    ### Examples od including other files
    
    ::paru::insert path/to/another/pandoc/markdown/file

## paru-code.rb

Inserts source code files in a code block in a pandoc markdown file.

### Example

    When writing a programming manual, you often use the *hello world!*
    program as an example. For example, see the following listing:

    ~~~{.ruby}
    ::paru::code path/to/source/code/file.rb
    ~~~

## paru-screenshot.rb

Automatically take screenshot of a web page and insert in a markdown file.

### Example

    - take a simple screenshot from a website on the internet

      ![This is my homepage](img/home_page.png "::paru::screenshot https://heerdebeer.org"){height=200px}

      Use the title text for the ::paru::screenshot command; if you want a title
      as well, everything after the url is treated as the title.

      Do make sure that the path to the directory wherein the screenshot is placed
      does exist. In this case, there should an `img` sub directory in the current
      directory.

    - take screenshot from a local page

      ![Load and capture the "a page.html" in this directory](img/apage.png "::paru::screenshot a%20page.html loading a simple page with a title"){width=50%}

    - inline images work too: ![caption does not show when an image is inline](img/apage.png "::paru::screenshot a%20page.html"){width=200px}

