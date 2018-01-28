function [r_matrix, r_Qf, r_N, r_var] = rearrangeData(matrix3d, Qf, N, var)

r_Qf = [];
for k = 1 : size(matrix3d,3)
    for i = 1 : size(matrix3d,2)
            r_Qf = [r_Qf Qf];
    end
end

r_N = [];
for k = 1 : size(matrix3d,3)
    for i = 1 : size(matrix3d,2)
        for j = 1 : size(matrix3d,1)
           r_N = [r_N N(i)]; 
        end
    end
end

r_var = [];
for k = 1 : size(matrix3d,3)
    for i = 1 : size(matrix3d,2)
        for j = 1 : size(matrix3d,1)
           r_var = [r_var var(k)]; 
        end
    end
end

r_matrix = [];
for i = 1 : size(matrix3d,3)
    temp = [];
    for j = 1 : size(matrix3d,2)
        temp = [temp matrix3d(:,j,i)'];
    end
    r_matrix = [r_matrix; temp];
end

end