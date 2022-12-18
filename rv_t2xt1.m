function t3 = rv_t2xt1(t2, t1, c_dim)
%
% Creates the outer product between: 
%   t2 (order four/6x6 in Voigt) and 
%   t1 (order two /1x6 in Voigt).
% inserting t1-elements along dimension c_dim
%

switch (c_dim)
    
    case 1 % t1 along x dimension        
        nx          = numel(t1);
        [ny, nz]    = size(t2);
        %
        t3 = zeros(nx, ny, nz);
        %
        for c_x = 1:nx
            t3(c_x,:,:) = t2 * t1(c_x);
        end
        
    case 2 % t1 along y dimension        
        ny          = numel(t1);
        [nx, nz]    = size(t2);
        %
        t3 = zeros(nx, ny, nz);
        %
        for c_y = 1:ny
            t3(:,c_y,:) = t2 * t1(c_y);
        end
        
        
    case 3 % t1 along z dimension
        nz          = numel(t1);
        [nx, ny]    = size(t2);
        %
        t3 = zeros(nx, ny, nz);
        %
        for c_z = 1:nz
            t3(:,:,c_z) = t2 * t1(c_z);
        end
        
end
end