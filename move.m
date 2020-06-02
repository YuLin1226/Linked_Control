function [new_pos] = move(v,w,pos,dt,num)
    x = pos(1);
    y = pos(2);
    theta = pos(3);
    if num == 1
        color = 'bo';
        dir = 'b';
    else
        color = 'ro';
        dir = 'r';
    end
    new_theta = theta + w*dt;
    new_x = x + v * cos(new_theta) *dt;
    new_y = y + v * sin(new_theta) *dt;
    hold on; grid on;box on;
    plot(new_x, new_y, color, 'MarkerSize',10);
    plot([new_x, new_x+ 0.03*cos(new_theta)], [new_y,  new_y + 0.03*sin(new_theta)], dir);
    new_pos = [new_x ; new_y ; new_theta];
    axis([10,15,8,13]);
end