function mat = MakeMatrix(theta)
    mat = zeros(2,2);
    mat(1,1) = cos(theta);
    mat(1,2) = -sin(theta);
    mat(2,1) = sin(theta);
    mat(2,2) = cos(theta);
end