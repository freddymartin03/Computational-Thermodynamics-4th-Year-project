function vle_binary_curves(iter, T)
    
    bub_curve = zeros(1, iter+1, 2)
    dew_curve = zeros(1, iter+1, 2)
    
    x = LinRange(0, 1, iter+1)
    
    for i_x in 1:iter+1
        local dummy_bub, dummy_dew, dummy_x
        dummy_bub = bubble_pressure(model_mix,T, [x[i_x],1-x[i_x]])
        bub_curve[1,i_x,1] = dummy_bub[1]
        bub_curve[1,i_x,2] = dummy_bub[4][1]
        dummy_dew = dew_pressure(model_mix,T,[x[i_x],1-x[i_x]])
        dew_curve[1,i_x,1] = dummy_dew[1]
        dew_curve[1,i_x,2] = dummy_dew[4][1]
        println("dew $i_x: dew_curve_comp = $(dew_curve[1,i_x,2])")
    end 
    
    return bub_curve, dew_curve
    
end