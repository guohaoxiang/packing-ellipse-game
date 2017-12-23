while(1)
[x,y] = getline;
vec = [x(2),y(2)] - [x(1),y(1)];
theta_att = acos(vec(1)/norm(vec));
%theta_att/pi
%theta_att = pi * rand(1);
x_att = x(1);
y_att = y(1);
[flag,dir_array] = IsEllipseFeasible(x_att,y_att,theta_att,C_array,theta_array,m,P,P_half);
if (flag)
    m = m + 1;
    C_array(m,1) = x_att + dir_array(1,flag);
    C_array(m,2) = y_att + dir_array(2,flag);
    theta_array(m) = theta_att;
    PlotEllipse(C_array(m,1),C_array(m,2),a,b,theta_att);
end
end