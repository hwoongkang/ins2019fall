%% Rotation matrix from ecef to local tangential
%{
* INPUT:
lat: latitude
lon: longitude. both in radians
* OUTPUT:
C: C_ECEF ^ local tangential
%}

function C = fromEcef2Tan(lat,lon)
    s1 = sin(lat);
    c1 = cos(lat);
    s2 = sin(lon);
    c2 = cos(lon);
    
    C = [ -s1*c2,   -s1*s2,  c1;
             -s2,       c2,  0;
          -c1*c2,   -c1*s2, -s1];

end