clear;close all;clc;
%parameters
%length and width of the rectangle
L = 20;
W = 10;
%semiaxis of the ellipse, a>b
a = 2;
b = 1;

P = [a^2,0;0,b^2];
P_half = [a,0;0,b];
theta = pi/4;
%theta_array stores the rotation angle of each ellipse
theta_array = zeros(100,1);
theta_array(:) = pi/4;
%C_array stores the center of each ellipse
C_array = zeros(100,2);
%number of times tried to pursue a feasible solution
N_att = 20;
%number of times tried to pursue the largest m
N_m = 5;
%number of existing ellipse
m = 1;
%put the first ellipse on the leftdown side of the graph
Q1 = MakeMatrix(theta);
x_gap = norm(P_half*Q1'*[1;0]);
y_gap = norm(P_half*Q1'*[0;1]);
C_array(1,1) = x_gap;
C_array(1,2) = y_gap;
it_att = 1;
it_m = 1;
figure;


while(it_m < N_m)
    it_att = 1;
    while(it_att < N_att)
       %try to generate a feasible solution
       theta_att = pi * rand(1);
       Q1 = MakeMatrix(theta_att);
       x_gap = norm(P_half*Q1'*[1;0]);
       y_gap = norm(P_half*Q1'*[0;1]);
       x_att = x_gap + rand(1)*(L - 2* x_gap);
       y_att = y_gap + rand(1)*(W - 2* y_gap);
%        x_att = 5;
%        y_att = 1;
       [flag,dir_array] = IsEllipseFeasible(x_att,y_att,theta_att,C_array,theta_array,m,P,P_half);
       if (flag)
           break;
       end
        
        it_att = it_att+1;
    end
    %if unfeasible,break;
    if(it_att == N_att)
        break;
    end
    m = m + 1;
    C_array(m,1) = x_att + dir_array(1,flag);
    C_array(m,2) = y_att + dir_array(2,flag);
    theta_array(m) = theta_att;

    %rect = getrect;
    it_m = it_m + 1;
end

%PlotEllipse(2,1,2,1,0);

i = 1;
while(i <= m)
    PlotEllipse(C_array(i,1),C_array(i,2),a,b,theta_array(i)); 
    i = i + 1;
end

rectangle('Position',[0,0,L,W]);
axis equal;

%rectangle('Position',[1,1,3,2],'Curvature',[1,1])