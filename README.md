# Paru filter collection

A collection of [pandoc](http://pandoc.org/) filters written in
[Ruby](https://www.ruby-lang.org/en/) and
[paru](https://heerdebeer.org/Software/markdown/paru/).

## Contents

- [paru-insert.rb](#paru-insertrb), inserting other pandoc markdown files
- [paru-code.rb](#paru-code.rb), inserting source code files in a code block

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
