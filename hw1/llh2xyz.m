%% llh 2 xyz
%{
* INPUT:
llh: 1by3 or 3by1 vector, lat - long - height resp.

* OUTPUT:
xyz: 1by3 row vector, x-y-z resp.
%}

function xyz = llh2xyz(llh)
    earth = Earth();
    lat = llh(1);
    lon = llh(2);
    hei = llh(3);
    
    R_E = earth.R / sqrt(1 - (earth.e*sin(lat))^2);
    
    x = (R_E + hei) * cos(lat) * cos(lon);
    y = (R_E + hei) * cos(lat) * sin(lon);
    z = ((1-earth.e*earth.e)*R_E + hei) * sin(lat);
    
    xyz = [x,y,z];
end

