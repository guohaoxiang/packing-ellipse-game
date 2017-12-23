function [dis,x_0] = MinDistance(C,S)
    cvx_begin quiet
    variable x(2)
    minimize( norm( x - C))
    subject to
        x'*S*x <= 1
    cvx_end
    dis = cvx_optval;
    x_0 = x;
end