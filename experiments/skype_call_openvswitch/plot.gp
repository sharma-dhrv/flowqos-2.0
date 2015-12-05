#!/usr/bin/gnuplot

set terminal postscript eps color enhanced font "Helvetica,18"


set output "plot.eps"

set yrange [25:70]
set xrange [0:240]

set ytics nomirror
set xtics nomirror

#set title "Long Multiplication vs Karatsuba Multiplication Runtime Analysis"

#set logscale x 2
#set logscale y 1000
set ylabel 'Jitter (msecs)'
set xlabel 'Time (secs)'
set key font "Helvetica,14" vertical
# at 90,1180

set arrow from 0,39.5714285714 to 240,39.5714285714 nohead lt 1 lc rgb "#00dd00" lw 1
set arrow from 0,53.3469387755 to 240,53.3469387755 nohead lt 2 lc rgb "#dd0000" lw 1
set arrow from 0,38.693877551 to 240,38.693877551 nohead lt 5 lc rgb "#0000dd" lw 1

plot "case3.dat" using ($1):($2):(1.0) title 'Skype Call (VoIP) only' smooth acsplines lt 1 lc rgb "#00dd00" lw 4, \
     "case2.dat" using ($1):($2):(1.0) title 'Skype Call (VoIP) + Background Traffic (File Download) without Flow Classification' smooth acsplines lt 2 lc rgb "#dd0000" lw 4, \
     "case1.dat" using ($1):($2):(1.0) title 'Skype Call (VoIP) + Background Traffic (File Download) with Flow Classification' smooth acsplines lt 5 lc rgb "#0000dd" lw 4

     
