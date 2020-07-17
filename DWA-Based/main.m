clear; clc; close all;

%% System Setup
av = 0.5;
aw = 0.5;
dt = 1;
resolution = dt / 10; % Should be less than av*dt & aw*dt;
%% Position
x = 2.5;
y = 2.5;
heading = 0;

%% Main
[v_applicable, w_applicable] = window_planner(av, aw, resolution, dt);
[pos_set] = Path_Planner(v_applicable, w_applicable, x, y, heading, dt);

Map = zeros(100,100);
Map(20:40 , 20:40) = -1;
Map(60:80 , 20:40) = -1;
Map(20:40 , 60:80) = -1;
Map(60:80 , 60:80) = -1;
% Plot Map
% for i = 1 : 100
%     for j = 1: 100
%         if Map(i,j) == -1
%             rectangle('position',[i j 1 1]);
%         end
%     end
% end

Data = floor(pos_set/0.05);

for i = 1:1
    for j =1:10
        plot(pos_set(j,end -2), pos_set(j, end -1),'ko'); hold on;
    end
end
% axis([2.5 2.6 2.4 2.6])

