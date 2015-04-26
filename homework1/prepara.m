function [Y, target, positivo, negativo] = prepara(N, X)

  % gera os 2 pontos para a função target.

  A = unifrnd(-1,1,1,2);
  B = unifrnd(-1,1,1,2);

  target = [A ; B];
  % descobre quem esta acima ou abaixo do target.

  positivo = [];
  negativo = [];

  for i=1:N
    if (side(A(1,:), B(1,:), X(i,1:2)) >= 0 )  
      positivo = [positivo ; X(i,1:2)];
      Y(i) = 1;
    else
      negativo = [negativo ; X(i,1:2)];
      Y(i) = -1;
    endif
  endfor

  % verifica se todos os pontos estão em um lado do target.
  if (rows(positivo) == 0 | rows(negativo) == 0)
    [Y, target, positivo, negativo] = prepara(N, X);
  endif;

endfunction