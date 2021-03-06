%% Rendezvouz
%  Description : This code solves the differential equation for the
%  rendezvouz problem and displays the paths of the agents
%  Parameters: 
%     none
%  Usage:
%       rendezvouz
%  Author: Giri Prashant, prashant7891@gmail.com
%  Date: 13th August, 2012

%% Code
clear;
clc;

number_nodes = 9;

vertex_coordinates = GetVertexCoordinates(number_nodes,50);
laplacian_matrix = laplacian(number_nodes);

x_temp = vertex_coordinates.x';
y_temp = vertex_coordinates.y';
time_step = 0.01;
simulation_length = 10000;
x_path = zeros(number_nodes,simulation_length);
y_path = zeros(number_nodes,simulation_length);


for i=1:simulation_length 
    
    x_next = x_temp - laplacian_matrix*x_temp*time_step;
    y_next = y_temp - laplacian_matrix*y_temp*time_step;
    
    x_path(:,i) = x_temp;
    y_path(:,i) = y_temp;
    x_temp = x_next;
    y_temp = y_next;    
    
end

plot(x_path,y_path,'*')