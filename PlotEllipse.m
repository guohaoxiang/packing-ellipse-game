function bool = PlotEllipse(x,y,a,b,theta)
%plot an ellipse with center(x,y), semiaxis a b and angle theta
    t=-pi:0.01:pi;
%     x0=x+a*cos(t-theta/2);
%     y0=y+b*sin(t+theta/2);
    R = [cos(theta),-sin(theta);sin(theta),cos(theta)];
    x0=a*cos(t);
    y0=b*sin(t);
    z = [x;y] + R * [x0;y0];
    x0 = z(1,:);
    y0 = z(2,:);
    plot(x0,y0);
    bool = true;
    hold on;
end