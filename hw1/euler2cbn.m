%% Cbn from euler angles, from body to tangent
%{
* INPUT:
euler 1by3 or 3by1 vector with roll,pitch,yaw resp.

* OUTPUT:
Cbn: 3by3 rotation matrix from body to local tangent
%}

function Cbn = euler2cbn(euler)
    s = @sin;
    c = @cos;
    x = euler(1); % phi
    y = euler(2); % theta
    z = euler(3);
    
    Cx = [1, 0, 0;
        0, c(x), s(x);
        0, -s(x), c(x)];
    Cy = [c(y), 0, -s(y);
        0, 1, 0;
        s(y), 0, c(y)];
    Cz = [c(z), s(z), 0;
        -s(z), c(z), 0;
        0,0,1];
    
    Cbn = Cx*Cy*Cz;
    
end
