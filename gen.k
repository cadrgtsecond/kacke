/ A small K script to generate a program for any string you want
/ Requires ngn/k or equivalent k6

s:"Hello World"
fillzero:{((8-#x)#0),x}
genop:{:[x;"+>";">"]}

` 1: ,/genop',/fillzero'2\'s
