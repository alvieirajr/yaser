N = 10pas;
maxRuns = 1000;
maxEpocas = 1000;
DEBUG_FLAG = 0;

soma_erros = 0;
soma_epocas = 0;

% gera o conjunto de dados.

for i=1:maxRuns

	printf ("Run  %i \n",i);
	fflush(stdout);

	X = unifrnd(-1, 1, N, 2);

	% gera o target e classificações para o conjunto de dado.
	[Y, target, positivo, negativo] = prepara(N, X);
	
	[erro, epocas, w] = treine(X, Y, target, positivo, negativo, maxEpocas, DEBUG_FLAG);

	% plota hipótese final.
	if DEBUG_FLAG
		a = -w(2)/w(3);       
		y1 = (a*-1)-(w(1)/w(3));
		y2 = (a*1)-(w(1)/w(3));
		plot([-1 1], [y1  y2], "-", "linewidth", 2, "color", "yellow");    
	endif;

	soma_erros = soma_erros + erro;
	soma_epocas = soma_epocas + epocas;

endfor;

printf ("\n");
printf ("Erro Medio...... %f \n", soma_erros/maxRuns);
printf ("Epocas Media.... %f \n", soma_epocas/maxRuns);
printf ("\n");


%hold off;