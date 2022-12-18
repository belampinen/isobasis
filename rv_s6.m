function E_s6 = rv_es6
%
% Creates the 6th order shear tensor from Ning 2021 
% (https://www.nature.com/articles/s41598-020-79748-3)

E_s6 = zeros(6,6,6);

% 1st cubicle: upper/left/front (1:3/1:3/1:3)
%
E_s6(1:3,1:3,1) = [...
    2 -1 -1
   -1 -1  2
   -1  2 -1];
E_s6(1:3,1:3,2) = [...
   -1 -1  2
   -1  2 -1
    2 -1 -1];
E_s6(1:3,1:3,3) = [...
   -1  2 -1
    2 -1 -1
   -1 -1  2];

% 2nd cubicle: upper/right/front (1:3/4:6/1:3)
% all zeros

% 3rd cubicle: lower/left/front  (4:6/1:3/1:3)
% all zeros

% 4th cubicle: lower/right/front (4:6/4:6/1:3)
E_s6(4:6,4:6,1) = [...
    3/2 0   0
    0   3/2 0
    0   0   -3];
E_s6(4:6,4:6,2) = [...
    3/2 0   0
    0   -3  0
    0   0   3/2];
E_s6(4:6,4:6,3) = [...
    -3  0   0
    0   3/2 0
    0   0   3/2];

% 5th cubicle: upper/left/back  (1:3/1:3/4:6)
% all zeros

% 6th cubicle: upper/right/back (1:3/4:6/4:6)
E_s6(1:3,4:6,4) = [...
    3/2 0   0
    3/2 0   0
   -3   0   0];
E_s6(1:3,4:6,5) = [...
    0   3/2 0
    0  -3   0
    0   3/2 0];
E_s6(1:3,4:6,6) = [...
    0   0  -3
    0   0   3/2  
    0   0   3/2];

% 7th cubicle: lower/left/back (4:6/1:3/4:6)
E_s6(4:6,1:3,4) = [...
    3/2  3/2 -3  
    0    0    0
    0    0    0];
E_s6(4:6,1:3,5) = [...
    0    0    0
    3/2 -3    3/2  
    0    0    0];
E_s6(4:6,1:3,6) = [...
    0    0    0
    0    0    0
   -3    3/2  3/2];  

% 8th cubicle: lower/right/back (4:6/4:6/4:6)
a = 9 / (2 * sqrt(2));
E_s6(4:6,4:6,4) = [...
    0  0  0
    0  0  a
    0  a  0];
E_s6(4:6,4:6,5) = [...
    0  0  a
    0  0  0
    a  0  0];
E_s6(4:6,4:6,6) = [...
    0  a  0
    a  0  0
    0  0  0];

% Final factor
E_s6 = E_s6 / 27;


%%% Norm
% (1 * (27*2) + 3 * (27*3/2) + 1 * (81*6/8)) / 27^2 = 35/108

end