function rslt = logMap(p, q)

cosTheta = transpose(p) * q;
pi_pq = p * cosTheta;
theta = acos(cosTheta);

rslt = (theta * (q - pi_pq)) / norm(q - pi_pq);

end