clc; clear;
%% 定義車輛位置
% --------- A車 ----------
x_a = 70;
y_a = 50;
theta_a = (pi/180)* 30;
pos_a = [x_a;y_a;theta_a];

% --------- B車 ----------
x_b = 30;
y_b = 50;
theta_b = (pi/180)* 0;
pos_b = [x_b;y_b;theta_b];

% --------- 限制 ----------
L = ( (pos_a(1) - pos_b(1))^2 + (pos_a(2) - pos_b(2))^2 )^0.5

%% Loop
for i = 1:200
L1 = ( (pos_a(1) - pos_b(1))^2 + (pos_a(2) - pos_b(2))^2 )^0.5
dt = 0.01;

% if abs(L - L_const) > L_const*0.05
%     disp('叭叭，失敗囉!!!');
%     break;
% end

% ---------- 定義 C車命令: ----------
% vc = 0.3; wc = pi/180*5; R = vc / wc;
% theta_c = atan2(pos_a(2) + 0.3*sin(pos_a(3))*dt   - pos_b(2) - 0.3*sin(pos_b(3)*dt) , pos_a(1) + 0.3*cos(pos_a(3))*dt  - pos_b(1) - - 0.3*cos(pos_b(3)*dt));

% ---------- 定義 A車命令: ----------
wa = pi / 180 * 10;
va = 0.3;

% ---------- 定義 B車命令: ----------
wb = 0.005;
vb = 0.5;

% ---------- 移動執行 ----------
[new_pos_a] = move(va,wa,pos_a,dt,1);
pos_a = new_pos_a;

[new_pos_b] = move(vb,wb,pos_b,dt,2);
pos_b = new_pos_b;

pos_c = (pos_a + pos_b)/2;
plot(pos_c(1) , pos_c(2), 'mo','MarkerSize',10)

pause(0.0001);
end