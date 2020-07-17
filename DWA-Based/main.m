clear; clc; close all;

%% System Setup
av = 0.5;
aw = 0.5;
dt = 0.5;
resolution = dt / 10; % Should be less than av*dt & aw*dt;
%% Position
x = 2.5;
y = 3;
heading = 0.5;

%% Main
[v_applicable, w_applicable] = window_planner(av, aw, resolution, dt);
[pos_set] = Path_Planner(v_applicable, w_applicable, x, y, heading, dt);

map = zeros(100,100);
map(20:40 , 20:40) = -1;
map(60:80 , 20:40) = -1;
map(20:40 , 60:80) = -1;
map(60:80 , 60:80) = -1;

data = floor( pos_set/0.05 );

% for i = 1:1
%     for j =1:10
%         plot(pos_set(j,end -2), pos_set(j, end -1),'ko'); hold on;
%     end
% end
path = [];
for i = 1 : length(data)/3
    if sum(data(:, 3*i-2) > 100) > 0 | sum(data(:, 3*i-1) > 100 ) > 0
        disp("======= Out of range =======");
    else
        idx = sub2ind(size(map), data(:, 3*i-2), data(:, 3*i-1));
        if sum(map(idx)) == 0
            path = [path , pos_set(:, 3*i-2), pos_set(:, 3*i-1), pos_set(:, 3*i)]; 
        end
    end
end

%% plot map
for i = 1 : 100
    for j = 1: 100
        if map(i,j) == -1
            rectangle('position',[i j 1 1]*0.05, 'FaceColor', 'k'); hold on;
        end
    end
end
rectangle('position',[0, 0, 100, 100]*0.05)

%% plot path
for i = 1 : length(pos_set)/3
    plot(pos_set(:, 3*i-2), pos_set(:, 3*i-1), 'b');
end

for i = 1 : length(path)/3
    plot(path(:, 3*i-2), path(:, 3*i-1), 'g');
end

axis([-1 6 -1 6])

path_a = path;
%% 分界線

%% System Setup
av = 0.5;
aw = 0.5;
dt = 0.5;
resolution = dt / 10; % Should be less than av*dt & aw*dt;
%% Position
x = 2.5;
y = 2.5;
heading = 0;

%% Main
[v_applicable, w_applicable] = window_planner(av, aw, resolution, dt);
[pos_set] = Path_Planner(v_applicable, w_applicable, x, y, heading, dt);

map = zeros(100,100);
map(20:40 , 20:40) = -1;
map(60:80 , 20:40) = -1;
map(20:40 , 60:80) = -1;
map(60:80 , 60:80) = -1;

data = floor( pos_set/0.05 );

% for i = 1:1
%     for j =1:10
%         plot(pos_set(j,end -2), pos_set(j, end -1),'ko'); hold on;
%     end
% end
path = [];
for i = 1 : length(data)/3
    if sum(data(:, 3*i-2) > 100) > 0 | sum(data(:, 3*i-1) > 100 ) > 0
        disp("======= Out of range =======");
    else
        idx = sub2ind(size(map), data(:, 3*i-2), data(:, 3*i-1));
        if sum(map(idx)) == 0
            path = [path , pos_set(:, 3*i-2), pos_set(:, 3*i-1), pos_set(:, 3*i)]; 
        end
    end
end

%% plot map
for i = 1 : 100
    for j = 1: 100
        if map(i,j) == -1
            rectangle('position',[i j 1 1]*0.05, 'FaceColor', 'k'); hold on;
        end
    end
end
rectangle('position',[0, 0, 100, 100]*0.05)

%% plot path
for i = 1 : length(pos_set)/3
    plot(pos_set(:, 3*i-2), pos_set(:, 3*i-1), 'b');
end

for i = 1 : length(path)/3
    plot(path(:, 3*i-2), path(:, 3*i-1), 'g');
end

path_b = path;





%% Compute 大車位置
path_c = [];
for i = 1 : length(path_a)/3
    for j = 1 : length(path_b)/3
        path_c = [path_c , ( path_a(:,3*i-2 : 3*i) + path_b(:,3*j-2 : 3*j) )/2;];
    end
end
%%

for i = 1 : length(path_c)/3
    plot(path_c(:, 3*i-2), path_c(:, 3*i-1), 'r');
end
