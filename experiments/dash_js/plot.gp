#!/usr/bin/gnuplot

set terminal postscript eps color enhanced font "Helvetica,18"


set output "plot.eps"

set yrange [0.01:3]
#set xrange [0:240]

set ytics nomirror
set xtics nomirror

#set title "Long Multiplication vs Karatsuba Multiplication Runtime Analysis"

set boxwidth 0.8
set style fill solid border 0
set style histogram errorbars gap 1 lw 2
set style data histograms
#set xtics rotate by -45


#set logscale x 2
set logscale y 10
set ylabel 'Average Segment Latency (msecs)'
#set xlabel 'Time (secs)'
set key font "Helvetica,12" vertical
# at 90,1180

#set arrow from 0,39.5714285714 to 240,39.5714285714 nohead lt 1 lc rgb "#00dd00" lw 0.5
#set arrow from 0,53.3469387755 to 240,53.3469387755 nohead lt 2 lc rgb "#dd0000" lw 0.5
#set arrow from 0,38.693877551 to 240,38.693877551 nohead lt 5 lc rgb "#0000dd" lw 0.5

plot 'data.dat' using 4:5:xtic(1) title 'DASH-JS (HTTP Video) Streaming only' lc rgb "#00dd00" lt 1 lw 3, \
     'data.dat' using 4:5:xtic(1) title 'DASH-JS (HTTP Video) Streaming + Background Traffic (Iperf TCP) with Flow Classification' lt 1 lw 3 lc rgb "#0000dd", \
     'data.dat' using 2:3:xtic(1) title 'DASH-JS (HTTP Video) Streaming + Background Traffic (Iperf TCP) without Flow Classification' lt 1 lw 3 lc rgb "#dd0000"

#plot "case3.dat" using ($1):($2):(1.0) title 'Skype Call (VoIP) only' smooth acsplines lt 1 lc rgb "#00dd00" lw 3, \
#     "case2.dat" using ($1):($2):(1.0) title 'Skype Call (VoIP) + Background Traffic (File Download) without Flow Classification' smooth acsplines lt 2 lc rgb "#dd0000" lw 3, \
#     "case1.dat" using ($1):($2):(1.0) title 'Skype Call (VoIP) + Background Traffic (File Download) with Flow Classification' smooth acsplines lt 5 lc rgb "#0000dd" lw 3

     
