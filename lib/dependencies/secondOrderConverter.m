function perSubunitSecond = secondOrderConverter(perMolarSecond);
  perSubunitSecond = perMolarSecond*10^6/(2*10^-15*6.022*10^23);
end
