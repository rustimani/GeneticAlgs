function R = crossingover(P, CHROMOSOME_LENGTH, P_Cr)
  R = [];
  while size(R, 1) < size(P, 1)
      p1 = P(floor(rand(1)*(size(P, 1) - 1) + 1), 1);
      p2 = P(floor(rand(1)*(size(P, 1) - 1) + 1), 1);
      if rand(1) < P_Cr
          cross = floor(rand(1)*(CHROMOSOME_LENGTH - 1));
          hight = 2^15 - 2^cross;
          low = 2^cross - 1;
          p1n = bitand(p1, hight) + bitand(p2, low);
          R = [R; p1n];
      end
      if rand(1) < P_Cr && size(R, 1) < size(P, 1)
          cross = floor(rand(1)*(CHROMOSOME_LENGTH - 1));
          hight = 2^15 - 2^cross;
          low = 2^cross - 1;
          p2n = bitand(p2, hight) + bitand(p1, low);
          R = [R; p2n];
      end
  end
end
