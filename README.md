Lights version 0.01
===================

Lights Out is a game invented by...

It is possibile reduce all the map to one row choosing a direction
(up to down, left to right, or viceversa) and pulling place in row
"under" the lights.

## SOLUTION

   01010 == 11100
   01101 == 10000 and 11110
   10001 == 11000
   11011 == 00100 and 11111
   11100 == ?

## CORRESPONDANCE

   00111 == 11011 == 11100
   01101 == 01010 == 10110

## SUM

   Warning: 10000 == 11110
   00111 + 10000 = 01010
   01010 + 10000 = 00111
   01101 + 10000 = s
   10001 + 10000 = 11100
   10110 + 10000 = 11011
   11011 + 10000 = 10110
   11100 + 10000 = 10001

   00111 + 11000 = 10110
   01010 + 11000 = 11011
   01101 + 11000 = 11100
   10001 + 11000 = s
   10110 + 11000 = 00111
   11011 + 11000 = 01010
   11100 + 11000 = 01101

   00111 + 11100 = 01101
   01010 + 11100 = s
   01101 + 11100 = 00111
   10001 + 11100 = 11011
   11011 + 11100 = 10001

   Center vertical simmetry
   00111 + 11111 = 11100
   01101 + 11111 = 10110
   10001 + 11111 = 01010
   11011 + 11111 = s
   11100 + 11111 = 00111

   01010 + 00100 = 10001
   
   00111 + 10100 = 10001
   01101 + 10100 = 11011

   Identity
   11011 + 10101 = 11011
   01101 + 10101 = 01101

### Simple reducer

   10000 => 01101
   11000 => 10001
   11100 => 01010
   11110 => 01101
   11111 => 11011

## INSTALLATION

To install this module type the following:

   perl Makefile.PL
   make
   make test
   make install

## DEPENDENCIES

- GUI: Wx

## COPYRIGHT AND LICENCE

Copyright (C) 2012 by simotrone

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself, either Perl version 5.14.2 or,
at your option, any later version of Perl 5 you may have available.

