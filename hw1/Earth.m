%% WGS84 Earth model

function out = Earth()
    out.R = 6378137;
    out.f = 298.257223563;
    out.e = 1/out.f;
end