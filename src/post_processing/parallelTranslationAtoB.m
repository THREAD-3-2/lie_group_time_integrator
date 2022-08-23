function rslt = parallelTranslationAtoB(a, b, w)

v = logMap(a, b);

rslt = parallelTranslation(a, v, w);

end