function s = rv_isobasis

%%%%% -- Second order (1x6) -- %%%%%
E_i2    = [1 1 1 0 0 0] * (1/3);    % Norm 1/3

%%%%% -- Fourth order (6x6) -- %%%%%
E_i4    = eye(6,6) * (1/3);         % Norm 2/3
E_b4    = E_i2' * E_i2;             % Norm 1/9
E_s4    = E_i4 - E_b4;              % Norm 5/9


%%%%% -- Sixth order (6x6x6) -- %%%%%
%
% -Bulk
%   Third outer product of iso 2
%   Norm = 1/27
%   Fully symmetric
%   Orthogonal vs shear and isoshear
E_b6    = zeros(6,6,6);            
for c_slice = 1:6
    E_b6(:, :, c_slice) = E_b4 * E_i2(c_slice);
end
%
% -Shear
%   From Ning 2021 (https://www.nature.com/articles/s41598-020-79748-3)
%   Norm = 35/108
%   Fully symmetric
%   Orthogonal vs bulk and isoshear
E_s6    = rv_s6;
%
% -Isoshear
%   Outer product between iso 2 and shear 4 
%
%   Three asymmetric forms: inserting iso 2 along x, y or z
%   Norm 5/27
%   Mutually orthogonal and with bulk and shear
E_i2s4     = rv_t2xt1(E_s4, E_i2, 1);
E_s2i2s2   = rv_t2xt1(E_s4, E_i2, 2);
E_s4i2     = rv_t2xt1(E_s4, E_i2, 3);
%
%   One symmetric form
%   Norm 5/81
%   Orthogonal with bulk and shear but not with asymmetric forms (ip = 5/81)
%  
E_is6      = (E_i2s4 + E_s2i2s2 + E_s4i2);      % Norm 5/9
%
E_i6       = E_b6 + E_s6 + E_is6;


%%% Output
%
s.E_i2  = E_i2;
%
s.E_i4  = E_i4;
s.E_b4  = E_b4;
s.E_s4  = E_s4;
%
s.E_b6  = E_b6;
s.E_s6  = E_s6;
s.E_i2s4 = E_i2s4;
s.E_s2i2s2 = E_s2i2s2;
s.E_s4i2 = E_s4i2;
s.E_is6 = E_is6;
s.E_i6 = E_i6;
end