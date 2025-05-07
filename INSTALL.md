It seems that a way to install this module can be to copy
the three "pages.\*" files into a directory "~/.nimble/pkgs/pages-0.01/".

This is what the 'make install' rule does in the "pages/" sub-directory.

Then we can compile our demos with pages, without the need to
specify any path to pages on the command line.

