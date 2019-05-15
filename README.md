# JSCL 

[![Build Status](https://travis-ci.org/jscl-project/jscl.svg?branch=master)](https://travis-ci.org/jscl-project/jscl)

JSCL is a Common Lisp to Javascript compiler, which is bootstrapped
from Common Lisp and executed from the browser.

<p align="center">
  <a href="https://jscl-project.github.io/">
    <img src="logo/logo-128.png" alt="JSCL" title="JSCL" height="128" />
  </a>
</p>


## Getting Started

You can try a demo online [here](https://jscl-project.github.io/), or
you can install the JSCL npm package:

    npm install -g jscl
    
to run `jscl-repl` in NodeJS.


## Build

If you want to hack JSCL, you will have to download the repository

    git clone https://github.com/jscl-project/jscl.git

to run `jscl-repl` in NodeJS.

This  is the  upstream version.  Ours —  CIWTA  version —  is hacked
a bit. We are currently aiming to stabilize a lot of things in time for
Tootsville to use them.

## Build

If you want to hack JSCL, you will have to download the repository

    git clone https://github.com/romance-ii/jscl.git

*load* `jscl.lisp`  in your  Lisp, and call  the bootstrap  functions to
compile the implementation itself:

    (jscl/bootstrap::load-jscl)
    (jscl/bootstrap::bootstrap)

It will generate a `jscl.js` file in the top of the source tree. Now you
can open `jscl.html`  in your browser and use it,  or run jscl-repl with
Node.js from the shell.

You can build also with

     make
     
This will probably only work in SBCL for now.

We also export

    (jscl/bootstrap:bootstrap-core)

if you don't  care to build the  REPLs. This will produce  a jscl.js but
not the Web or Node REPLs.

## Status

JSCL is and will be a subset of Common Lisp. Of course it is far from
complete, but it supports partially most common special operators,
functions and macros. In particular:

- Multiple values

- Explicit control transfers
  [tagbody](http://www.lispworks.com/documentation/HyperSpec/Body/s_tagbod.htm)
  and [go](http://www.lispworks.com/documentation/HyperSpec/Body/s_go.htm)

- Static and dynamic non local exit [catch](http://www.lispworks.com/documentation/HyperSpec/Body/s_catch.htm), 
  [throw](http://www.lispworks.com/documentation/HyperSpec/Body/s_throw.htm); 
  [block](http://www.lispworks.com/documentation/HyperSpec/Body/s_block.htm),
  [return-from](http://www.lispworks.com/documentation/HyperSpec/Body/s_ret_fr.htm).

- Lexical and special variables. However, declare expressions are
  not actually supported, but you can *proclaim* special variables.

- Optional and keyword arguments

- SETF places

- Packages

- The `LOOP` macro

- The `FORMAT` function

- CLOS

- Others

The compiler is very verbose,  some simple optimizations or minification
could  help to  deal with  it. We  are working  to ensure  that Google's
Closure  Compiler  can  be  used to  post-process  it  safely,  although
CL-Uglify and Yahoo Uglify are both being observed.

Most of the  above features are incomplete. The major  features that are
still missing are:

- Proper condition system

- Gray streams and generally useful stream and file I/O functions

*Feel free to hack it yourself*

