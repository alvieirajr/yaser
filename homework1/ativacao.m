function result = ativacao(x, w)

  result = -1;
  %soma = (x(1) * w(1)) + (x(2) * w(2)) + (x(3) * w(3));
  soma = sum(x*w');
      
  if soma >= 0
    result = 1;
  endif   
 
endfunction

