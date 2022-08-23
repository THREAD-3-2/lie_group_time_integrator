function rslt = parallelTranslation(p, v, w)
% Parallel translate the tangent vector w at point p,
% along the geodesic with initial direction v

vNorm = norm(v);
if vNorm < 1e-12
    wParall = w;
else
    cosAlpha = transpose(v) * w;
    scaleFactor = cosAlpha / (vNorm * vNorm);
    wOrth = w - v * scaleFactor;
    vParall = p * (-sin(vNorm) * vNorm) + v * cos(vNorm);
    wParall = vParall * scaleFactor + wOrth;
end

rslt = wParall;

end