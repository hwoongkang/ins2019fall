% corners in the body frame, in column vectors
corners = [  0.5, -0.25, 0;
    0.5,  0.25, 0;
    -0.75,   0.25,0;
    -0.75,   -0.25,0].';

% offset
offset = [100;50;-7];

% euler angles, in column vectors
angles = [45, 0, 0;
    0, 45, -30;
    45, 45 ,0;
    45, -45, 0].';

for angleInd = 1:size(angles,2)
    % need to convert to radians first
    Cbn = euler2cbn((pi/180) * angles(:,angleInd));
    
    fprintf("%3d%3d%3d ->\n",angles(:,angleInd));
    
    for cornerInd = 1:4
        body = corners(:,cornerInd);
        tang = offset + Cbn * body;
        fprintf("\t%8.2f%8.2f%8.2f\n",tang);
    end
end
        