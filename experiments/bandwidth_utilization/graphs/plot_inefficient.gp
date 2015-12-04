#!/usr/bin/gnuplot

set terminal postscript eps color enhanced font "Helvetica,14"


set output "plot_inefficient.eps"

set yrange [0:1600]
set xrange [0:120]

set ytics nomirror
set xtics nomirror

#set title "Long Multiplication vs Karatsuba Multiplication Runtime Analysis"

#set logscale x 2
#set logscale y 1000
set ylabel 'Throughput (Kbps)'
set xlabel 'Time (secs)'
set key font "Helvetica,10" vertical at 120,1580

set label "Maximum Available Bandwidth" font "Helvetica,10" at 5,1230

set arrow from 0,1200 to 120,1200 nohead lt 1 lc rgb "#000000" lw 0.5
#set arrow from 0,482.240 to 90,482.240 nohead lt 2 lc rgb "#dd0000" lw 0.5
#set arrow from 0,586.305742574257 to 90,586.305742574257 nohead lt 5 lc rgb "#0000dd" lw 0.5

plot "inefficient.dat" using ($1):($2/1000.0):(2.0) title 'Video (RTP)' smooth acsplines lt 1 lc rgb "#00dd00" lw 3, \
     "inefficient.dat" using ($1):($3/1000.0):(2.0) title 'Background Traffic (Iperf TCP)' smooth acsplines lt 2 lc rgb "#dd0000" lw 3, \
     "inefficient.dat" using ($1):($4/1000.0):(2.0) title 'Total Bandwidth Consumption' smooth acsplines lt 5 lc rgb "#0000dd" lw 3

     
