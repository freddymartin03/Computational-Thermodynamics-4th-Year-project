using Clapeyron
using Plots
using CSV
using DataFrames
using LaTeXStrings
using Measures


plt = plot(grid = :off, 
      framestyle = :box, 
      foreground_color_legend = nothing, 
      legend_font = font(12),
      xtickfont = font(12),
      ytickfont = font(12),
      #yaxis = :log,
      xlims = (0, 1),
      legend =:topleft,
      left_margin = 4mm,
      right_margin = 4mm,
      xguidefontsize=16,
      yguidefontsize=16)