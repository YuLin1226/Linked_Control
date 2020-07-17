clear;
v = 1;
w = 1;
x=0;
y=0; 
heading = 0;
dt=0.5;

pre_step = 9;
    pos_set = [];
    for i = 1 : length(v)
        for j = 1 : length(w)
            new_pos = [x, y, heading];
            for k = 1:pre_step
                new_x = new_pos(k, 1) + v(i)*cos( new_pos(k, 3) )*dt;
                new_y = new_pos(k, 2) + v(i)*sin( new_pos(k, 3) )*dt;
                new_heading = new_pos(k, 3) + w(j)*dt;
                new_pos = [new_pos; new_x, new_y, new_heading];
            end
            pos_set = [pos_set, new_pos];
        end
        
    end
    
    
for i = 1:1
    for j =1:10
        plot(pos_set(j,end - 2),pos_set(j,end-1),'ko'); hold on;
    end
end