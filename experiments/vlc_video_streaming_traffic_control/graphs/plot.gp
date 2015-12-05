#!/usr/bin/gnuplot

set terminal postscript eps color enhanced font "Helvetica,18"


set output "plot.eps"

set yrange [0:1600]
set xrange [0:90]

set ytics nomirror
set xtics nomirror

#set title "Long Multiplication vs Karatsuba Multiplication Runtime Analysis"

#set logscale x 2
#set logscale y 1000
set ylabel 'Video Stream Bitrate (Kbps)'
set xlabel 'Time (secs)'
set key font "Helvetica,16" vertical at 90,1580

set arrow from 0,587.173861386139 to 90,587.173861386139 nohead lt 1 lc rgb "#00dd00" lw 1
set arrow from 0,549.302178217822 to 90,549.302178217822 nohead lt 2 lc rgb "#dd0000" lw 1
set arrow from 0,586.305742574257 to 90,586.305742574257 nohead lt 5 lc rgb "#0000dd" lw 1

plot "case3.dat" using ($1-9):($2/1000.0):(2.0) title 'Video (RTP) only' smooth acsplines lt 1 lc rgb "#00dd00" lw 4, \
     "case2_2.dat" using ($1-3):($2/1000.0):(2.0) title 'Video (RTP) + Background Traffic (Iperf TCP) without Flow Classification' smooth acsplines lt 2 lc rgb "#dd0000" lw 4, \
     "case1.dat" using ($1):($2/1000.0):(2.0) title 'Video (RTP) + Background Traffic (Iperf TCP) with Flow Classification' smooth acsplines lt 5 lc rgb "#0000dd" lw 4

     
