#!/usr/bin/gnuplot

set terminal postscript eps color enhanced font "Helvetica,14"


set output "plot.eps"

set yrange [200:1200]
set xrange [0:90]

set ytics nomirror
set xtics nomirror

#set title "Long Multiplication vs Karatsuba Multiplication Runtime Analysis"

#set logscale x 2
#set logscale y 1000
set ylabel 'Video Stream Bitrate (Kbps)'
set xlabel 'Time (secs)'
set key font "Helvetica,10" vertical at 90,1180

set arrow from 0,582.507722772277 to 90,582.507722772277 nohead lt 1 lc rgb "#00dd00" lw 0.5
set arrow from 0,482.131485148515 to 90,482.131485148515 nohead lt 2 lc rgb "#dd0000" lw 0.5
set arrow from 0,584.786534653465 to 90,584.786534653465 nohead lt 5 lc rgb "#0000dd" lw 0.5

plot "case3.dat" using ($1-11):($2/1000.0):(2.0) title 'Video (RTP) only' smooth acsplines lt 1 lc rgb "#00dd00" lw 3, \
     "case2.dat" using ($1):($2/1000.0):(2.0) title 'Video (RTP) + Background Traffic (Iperf TCP) without Flow Classification' smooth acsplines lt 2 lc rgb "#dd0000" lw 3, \
     "case1.dat" using ($1-9):($2/1000.0):(2.0) title 'Video (RTP) + Background Traffic (Iperf TCP) with Flow Classification' smooth acsplines lt 5 lc rgb "#0000dd" lw 3

     
