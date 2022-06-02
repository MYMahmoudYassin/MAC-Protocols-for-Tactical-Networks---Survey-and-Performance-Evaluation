clc; clear all;
goodtime = [];
k=1;
% fileID = fopen('input_network.txt','r');
% formatSpec = '%f';
% Input = fscanf(fileID,formatSpec); % Input about relevant info read %
% fclose(fileID);
P_L = 0;
% N = [1:200];%Input(1); % get number of nodes *
% N = Input(1);
N=100;
Packet_size =2000;
% Packet_size = Input(2) * 8; % get the packet size in bits %
% T = Input(3) * 10^-3; % get simulation time in s %
T=200*10^-3;
Backoff_St = input('enter strategy')%%Input(4); % get the random backoff strategy %
if Backoff_St == 1
% Strategy 1 %
for node = 1:length(N)
total_time = 0;
count = 0;
good_time = 0;
data_rate = 6 * 10^6; % 6 Mbps %
packet_time = Packet_size / data_rate; % get packet time %
slot_size = 9 * (10^-6); % 9 us %
j = 1;
simulation_count = 0;
CW_min = 15;
CW = 15;
collision_flag = 0;
r = (randi([0,CW_min],N(node),1)) * 10^-6; % generate N random numbers and put them into an array %
simulation_time = [1:5000];
while total_time < T
for p=1:length(simulation_time)
[M,I] = min(r); % find the node with the minimum counter and index of node %
simulation_count = simulation_count + 1;
for i = 1:N(node) % check if there are more than one nodes with same minimum counter %
if (M == r(i))
count = count + 1;
collision_index(j) = i;
j = j + 1;
end
end
if count > 1
collision_flag = 1; % collision occured %
P_L = P_L + 1;
end
if collision_flag ~= 1 % if no collision, increase good time %
good_time = good_time + packet_time;
CW = CW_min;
r(I) = (randi([0,CW],1,1)) * 10^-6;
else
CW = CW * 2;
for i = 1:N(node)
if (M == r(i)) % for all nodes that collided, choose new rand %
r(i) = (randi([0,CW],1,1)) * 10^-6;
end
end
end
total_time = total_time + packet_time;
for i = 1:N(node)
for j = 1:size(collision_index)
if(i ~= collision_index(j))
r(i) = r(i) - slot_size;
end
end
end
count = 0;
collision_flag = 0;
Loss(p) = P_L;
end
end
utility(node) = good_time / total_time;
goodtime(k) = good_time;
k=k+1;
end
figure1 = figure;
axes1 = axes('Parent',figure1)
plot(simulation_time, Loss,'--','LineWidth',2)
% figure
% plot(N,utility)
hold on
end
Backoff_St = input('enter strategy')
if Backoff_St == 2
% Strategy 2 %
for node = 1:length(N)
P_L1 = 0;
total_time = 0;
count = 0;
good_time = 0;
data_rate = 6 * 10^6; % 6 Mbps %
packet_time = Packet_size / data_rate; % get packet time %
slot_size = 9 * (10^-6); % 9 us %
j = 1;
simulation_count = 0;
CW_min = 15;
CW = 15;
collision_flag = 0;
r = (randi([0,CW_min],N(node),1)) * 10^-6; % generate N random numbers and put them into an array %
while total_time < T
for p = 1:length(simulation_time)%while total_time < T
[M,I] = min(r); % find the node with the minimum counter and index of node %
simulation_count = simulation_count + 1;
for i = 1:N(node) % check if there are more than one nodes with same minimum counter %
if (M == r(i))
count = count + 1;
collision_index(j) = i;
j = j + 1;
end
end
if count > 1
collision_flag = 1; % collision occured %
P_L1 = P_L1 + 1;
end
if collision_flag ~= 1
good_time = good_time + packet_time;
CW = round(CW,2);
r(I) = (randi([0,CW],1,1)) * 10^-6;
else
CW = CW + 2;
for i = 1:N(node)
if (M == r(i))
r(i) = (randi([0,CW],1,1)) * 10^-6;
end
end
end
total_time = total_time + packet_time;
for i = 1:N(node)
for j = 1:size(collision_index)
if(i ~= collision_index(j))
r(i) = r(i) - slot_size;
end
end
end
count = 0;
collision_flag = 0;
Loss1(p) = P_L1;
end
end
utility1(node) = good_time / total_time;
goodtime(k) = good_time;
k=k+1;
end
plot(simulation_time, Loss1,'--','LineWidth',2)
% plot(N,utility1)
end
Backoff_St = input('enter strategy')
if Backoff_St == 3
for node = 1:length(N)
% Strategy 3 %
total_time = 0;
count = 0;
good_time = 0;
data_rate = 6 * 10^6; % 6 Mbps %
packet_time = Packet_size / data_rate; % get packet time %
slot_size = 9 * (10^-6); % 9 us %
j = 1;
P_L2 = 0;
simulation_count = 0;
CW_min = 15;
CW = 15;
collision_flag = 0;
r = (randi([0,CW_min],N(node),1)) * 10^-6; % generate N random numbers and put them into an array %
while total_time < T
for p=1:length(simulation_time)
[M,I] = min(r); % find the node with the minimum counter and index of node %
simulation_count = simulation_count + 1;
for i = 1:N(node) % check if there are more than one nodes with same minimum counter %
if (M == r(i))
count = count + 1;
collision_index(j) = i;
j = j + 1;
end
end
if count > 1
collision_flag = 1; % collision occured %
P_L2 = P_L2 + 1;
end
if collision_flag ~= 1
good_time = good_time + packet_time;
CW = round(CW,2);
r(I) = (randi([0,CW],1,1)) * 10^-6;
else
CW = CW * 2;
for i = 1:N(node)
if (M == r(i))
r(i) = (randi([0,CW],1,1)) * 10^-6;
end
end
end
total_time = total_time + packet_time;
for i = 1:N(node)
for j = 1:size(collision_index)
if(i ~= collision_index(j))
r(i) = r(i) - slot_size;
end
end
end
count = 0;
collision_flag = 0;
Loss2(p) = P_L2;
end
end
utility2(node) = good_time / total_time;
goodtime(k) = good_time;
k=k+1;
end
% plot(N, utility2)
plot(simulation_time, Loss2,'--','LineWidth',2)
end
legend('802.11', 'Additive increase multiplicative decrease','Multiplicative increase multiplicative decrease','Additive increase additive decrease')
xlabel('Simulation Time (sec)')
ylabel('Number of Packets dropped')
title('Packet loss with N=100')
saveas(figure1, 'Packetloss.jpg')
% legend('802.11', 'Additive increase multiplicative decrease','Multiplicative increase multiplicative decrease','Additive increase additive decrease')
% xlabel('Number of nodes (N)')
% ylabel('Network Utilization')
% title('CSMA/CA with random backoff ')
% fprintf('Number of Nodes: %d ; Packet Size: %d ; Simulation Time(s): %d ; Backoff Strategy: %d \n Utilization: ', N, Input(2), T, Backoff_St);
% saveas(figure1, 'Utilization.jpg')
disp(utility);
color= ['r','g','b','k'];
figure, hold on
% % if data is more than colors then colors will be repeated
m = length(color);
for k = 1:length(goodtime)
i = mod(k-1,m); %%i is remainder after division of k-1 by m
i = i+1;
h=bar(k,goodtime(k));
set(h,'FaceColor','flat');
end
legend('802.11', 'Additive increase multiplicative decrease','Multiplicative increase multiplicative decrease','Additive increase additive decrease')
ylabel('Frame time (sec)')