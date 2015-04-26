function plota(X, target, positivo, negativo)

  clf;
  hold on;
  axis([-1 1 -1 1]);

  % calcula o coeficiente angular do target.
  m = (target(1,2) - target(2,2)) / (target(1,1) - target(2,1));
  
  % calcula b.
  b =  target(1,2) - ( m * target(1,1) );
  
  % plota reta correspondente ao target.
  plot([-1, 1],[(m*-1)+b, (m*1)+b], "-", "linewidth", 2, "color", "green");  

  % plota o conjunto de treino.
  gplot([1:rows(positivo)], positivo, ".b");
  gplot([1:rows(negativo)], negativo, ".r");

  % plota a linha.
  %gplot([1], target, "-");
  

endfunction