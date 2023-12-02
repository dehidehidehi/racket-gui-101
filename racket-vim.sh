#!/bin/sh

file=main.rkt
module=main

statement="(enter! \"$file\")
(require racket/enter syntax/location \"$file\")
(dynamic-enter! (quote-module-path $module))"

racket --repl \
--make \
--eval "$statement"
