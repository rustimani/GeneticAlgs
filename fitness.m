function R = fitness(P, S)
  shift = 2; % f(1.999) = -893.927
  F = f(S(P + 1)) + shift;
  s = sum(F);
  R = [P, F ./ s];
end
