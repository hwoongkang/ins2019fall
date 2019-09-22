%% degree, minute, second to radians
%{
* INPUT
dmsIn: 3 by 1, or 1 by 3
deg - min- sec

* OUTPUT
radOut: scalar in Radians
%}
function radOut = dms2rad(dmsIn)
    degOut = dmsIn(1) + dmsIn(2)/60 + dmsIn(3)/3600;
    radOut = (pi/180) * degOut;
end