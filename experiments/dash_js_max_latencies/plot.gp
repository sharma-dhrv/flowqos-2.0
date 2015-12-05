#!/usr/bin/gnuplot

set terminal postscript eps color enhanced font "Helvetica,18"


set output "plot.eps"

set yrange [0:1.5]
set xrange [0:480]

set ytics nomirror
set xtics nomirror

#set title "Long Multiplication vs Karatsuba Multiplication Runtime Analysis"

#set logscale x 2
#set logscale y 1000
set ylabel 'Maximum Segment Latency (msecs)'
set xlabel 'Time (secs)'
set key font "Helvetica,12" vertical
# at 90,1180

set arrow from 0,0.1568 to 480,0.1568 nohead lt 1 lc rgb "#00dd00" lw 1
set arrow from 0,0.40004 to 480,0.40004 nohead lt 2 lc rgb "#dd0000" lw 1
set arrow from 0,0.3143333333 to 480,0.3143333333 nohead lt 5 lc rgb "#0000dd" lw 1

plot "case3.dat" using ($1):($2):(1.0) title 'DASH-JS (HTTP Video) Streaming only' smooth acsplines lt 1 lc rgb "#00dd00" lw 4, \
     "case2.dat" using ($1):($2):(1.0) title 'DASH-JS (HTTP Video) Streaming + Background Traffic (Iperf TCP) without Flow Classification' smooth acsplines lt 2 lc rgb "#dd0000" lw 4, \
     "case1.dat" using ($1):($2):(1.0) title 'DASH-JS (HTTP Video) Streaming + Background Traffic (Iperf TCP) with Flow Classification' smooth acsplines lt 5 lc rgb "#0000dd" lw 4

     
