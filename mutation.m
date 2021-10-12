function R = mutation(P, CHROMOSOME_LENGTH, P_M)
  R = P;
  for i = 1:size(R, 1)
      if rand(1) < P_M
          bitNumber = floor(rand(1)*(CHROMOSOME_LENGTH - 1) + 1);
          R(i, 1) = bitset(R(i, 1), bitNumber, not(bitget(R(i, 1), bitNumber)));
      end
  end
end
