clc; clear;
%% 定義車輛位置

% --------- 前車 ----------
x_b = 10.70;
y_b = 10.90;
theta_b = (pi/180)* 60;
pos_b = [x_b;y_b;theta_b];

% --------- 後車 ----------
x_a = 10.70;
y_a = 10.50;
theta_a = (pi/180)* 120;
pos_a = [x_a;y_a;theta_a];

% --------- 幾何限制 ----------
L = ( (x_a - x_b)^2 + (y_a - y_b)^2 )^0.5;

% --------- 紀錄 ----------
L_output = [];
t = [];


va = 0.3; err_last = 0;
%% Loop
for i = 1:300
dt = 0.1;

% ---------- 前車命令 ----------
t_x = pos_b(1) + rand * 0.01; t_y = pos_b(2) + rand * 0.01;
vb = 0.30;
wb = -pi / 180 * 10;


% ---------- 後車命令 ----------
D = ((pos_a(1) - t_x)^2 + (pos_a(2) - t_y)^2 )^0.5;
theta = atan2(pos_a(2) - t_y , pos_a(1) - t_x) - pos_a(3);
R = D / (2 * sin( abs(theta)) );
err = (L - D);
va = va - err*0.7 + err_last*0.5;
wa =  -sign(theta)* va / R;
err_last = err;


% ---------- 移動執行 ----------
[new_pos_b] = move(vb,wb,pos_b,dt,2);
pos_b = new_pos_b;

[new_pos_a] = move(va,wa,pos_a,dt,1);
pos_a = new_pos_a;

pause(0.0001);

L_output = [L_output ; D];
t = [t;dt * i];
end

figure(2);
plot(t , L_output);
xlabel('Time'); ylabel('Distance between A & B');