function [v_applicable, w_applicable] = window_planner(av, aw, resolution, dt)
    v_max = av * dt;
    v_min = 0;
    v_num = (v_max - v_min) / resolution;
    
    w_max = aw * dt;
    w_min = -aw * dt;
    w_num = (w_max - w_min) / resolution;
    
    v_applicable = [v_min, zeros(1,v_num -1)];
    for i = 2: v_num
        v_applicable(i) = v_applicable(i-1) + resolution;
    end
    
    w_applicable = [w_min, zeros(1,w_num -1)];
    for i = 2: w_num
        w_applicable(i) = w_applicable(i-1) + resolution;
    end
end