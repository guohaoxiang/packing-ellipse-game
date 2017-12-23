function [flag,dir_array] = IsEllipseFeasible(x_att,y_att,theta_att,C_array,theta_array,m,P,P_half)
%judge whether a new ellipse with center x_att,y_att and rotation angle
%theta is feasible with the existing m ellipses
%distance_array return the distance of of center of new ellipse to existing
%ellipses
flag = 1;
distance_array = zeros(m,1);
j = 1;
Q_att = MakeMatrix(theta_att);
dir_array = zeros(2,m);
C = inv(P_half)*Q_att'*[x_att;y_att];
while(j <= m)
    Q_j = MakeMatrix(theta_array(j));
    S = P_half*Q_att'*Q_j*inv(P)*Q_j'*Q_att*P_half;
    C_all = C - inv(P_half)*Q_att'*C_array(j,:)';
    [distance_array(j),x] = MinDistance(C_all,S);
    dir = x - C_all;
    dir = (norm(dir) -  1) * dir/norm(dir);
    dir_array(:,j) = Q_att * P_half * dir;
    %distance_array(j) = 1;
    j = j + 1;
end
distance_array
if (min(distance_array)< 1)
    flag = 0;
else
    [temp,flag] = min(distance_array);
end

end