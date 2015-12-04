#!/usr/bin/gnuplot

set terminal postscript color enhanced font "Helvetica,12"

set datafile separator ","
set output "result"

set ytics nomirror
set xtics nomirror

set xlabel 'time (s)'
set ylabel 'bitrate (bits/s)'
set key left vertical

plot "data.csv" using 1:2 title 'case1' with lines lt rgb "red" lw 1 , \
      "data.csv" using 1:3 title 'case2'   with lines lt rgb "blue" lw 1 , \
      "data.csv" using 1:4 title 'case3'   with lines lt rgb "green" lw 1 , \
      "data.csv" using 1:5 title 'avg-case1'   with lines lt rgb "red" lw 1 , \
      "data.csv" using 1:6 title 'avg-case2'   with lines lt rgb "blue" lw 1 , \
      "data.csv" using 1:7 title 'avg-case3'   with lines lt rgb "green" lw 1
