function y = f(x)
  y = zeros(size(x));
  mask = abs(x) ~= 2;
  y(mask) = cos(2.*x(mask))./abs(x(mask)-2);
end
