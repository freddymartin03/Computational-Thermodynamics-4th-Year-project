function vle_binary_plotting_function(iter, model, T, xlims)
    
    N = size(T)[1]
    println(N)

    bub_curve = zeros(N, iter+1, 2) # N rows iter+1 cols with 2 elements each
    dew_curve = zeros(N, iter+1, 2)
    
    x = LinRange(0, 1, iter+1)
    
    for i_T in 1:N
        #loop through temp
        for i_x in 1:iter+1
            local dummy_bub, dummy_dew, dummy_x
            dummy_bub = bubble_pressure(model,T[i_T], [x[i_x],1-x[i_x]])
            bub_curve[i_T,i_x,1] = dummy_bub[1]
            bub_curve[i_T,i_x,2] = dummy_bub[4][1]
            dummy_dew = dew_pressure(model,T[i_T],[x[i_x],1-x[i_x]])
            dew_curve[i_T,i_x,1] = dummy_dew[1]
            dew_curve[i_T,i_x,2] = dummy_dew[4][1]
            #println("dew $i_x: dew_curve_comp = $(dew_curve[1,i_x,2])")
        end 
    
    end

    plt = plot(grid = :off, 
               framestyle = :box, 
               foreground_color_legend = nothing, 
               legend_font = font(12),
               xtickfont = font(12),
               ytickfont = font(12),
               xlims = xlims,
               ylims = (0, maximum(bub_curve)/1e5 + 0.1*maximum(bub_curve)/1e5))
    
    colors = ["indianred2", "springgreen4", "deepskyblue1", "mediumorchid2", "chocolate1"]
    
    for i_T in 1:N
        plot!(plt, [1.0.-x], (bub_curve[i_T, :, 1] ./ 1e5), 
              seriestype = :scatter, 
              color = colors[i_T], 
              markerstrokecolor = "black", 
              line = (:path, 3), 
              label = "SAFT-γ Mie ($(T[i_T])K)")
        
        plot!(plt, [1.0.-x], (dew_curve[i_T, :, 1] ./ 1e5), 
              seriestype = :scatter, 
              color = colors[i_T], 
              markerstrokecolor = "black", 
              line = (:path, 3), 
              label = nothing)
    end

    xlabel!(plt, "Composition", yguidefontsize=12)
    ylabel!(plt, "Pressure / (bar)", xguidefontsize=12)

    return plt

end

