% each row responds to the city
% columns are the d,m,s, resp.

% latitude
lats = [    26, 08, 42.20;
            33, 53, 28.15;
            53, 53, 58.61;
            13, 49, 53.05];
        
% longitude in E
longs= [    28, 03, 00.92;
           151, 14, 57.07;
            27, 34, 21.01;
            % 360 - [171, 45, 06.71]
           188, 14, 53.29];
       
heights = [1660.86; 86.26; 197.21; 8.53];

cities = ["Pretoria"; "Sydney"; "Minsk"; "Apia"];

for n=1:4
    lat = dms2rad(lats(n,:));
    long = dms2rad(longs(n,:));
    height = heights(n);
    
    fprintf("%10s\n",cities(n));
%     fprintf("x: %.2f, y: %.2f, z: %.2f\n\n",llh2xyz([lat,long,height]))
    fprintf("%.2f \t %.2f \t %.2f\n\n",llh2xyz([lat,long,height]))
    fprintf("C_ECEF^TAN = \n%.5f\t%.5f\t%.5f\n%.5f\t%.5f\t%.5f\n%.5f\t%.5f\t%.5f\n",fromEcef2Tan(lat,long));
end

