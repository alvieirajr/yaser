function [erro, epocas, w] = treine(X, Y, target, positivo, negativo, maxEpocas, DEBUG_FLAG)

  w = [0.0000 0.0000 0.0000];
  N = rows(X);
  x = [];
  y = [];

  erro_anterior = -1;
  aux_cnt = 0;
  
  for i=1:maxEpocas

    if DEBUG_FLAG
        plota(X, target, positivo, negativo);
        printf ("Iteração %i \n",i);
        fflush(stdout);
    endif

    missclassified = [];

    % varre todo conjunto de teste e define um vetor de pontos
    % que não satisfazem a hipótese.

    for j=1:N
        x = [X(j, :)];    
        y = Y(j);        
        saida = ativacao([1 x], w);
        %saida = side(target(1,:), target(2,:), x);

        if saida != y
            missclassified = [missclassified ; j];
        endif;
    endfor

    % plota hipótese atual.
    if DEBUG_FLAG
        a = -w(2)/w(3);        
        y1 = (a*-1)-(w(1)/w(3));
        y2 = (a*1)-(w(1)/w(3));
        plot([-1 1], [y1  y2], "-", "linewidth", 1, "color", "red");
    endif;
     
    if rows(missclassified) > 0

        rand_i = randintegers(1, rows(missclassified));
        
        %pega os parâmetros da instância.
        x = [1 X(missclassified(rand_i), 1:2)];
        
        %pega o y da instância.
        y = Y(rand_i);
     
        %destaca instância corrente.
        if DEBUG_FLAG
            gplot([1], x(2:3), '.s');
        endif

        erro = (rows(missclassified)/N);

        saida = ativacao(x, w);
        
        if (saida != y)
            w = corrigirPesos(w, x, y);
            flag_treinado = true;
        endif        

    else

        erro = (rows(missclassified)/N);
        %erro

        epocas = i;
        break;

    endif
 
    erro = (rows(missclassified)/N);
    epocas = i;

    if DEBUG_FLAG
        erro = (rows(missclassified)/N)
        pause;
    endif;

    if (erro_anterior == erro) 
        aux_cnt=aux_cnt+1;
        
        %se passou 1% no mesmo erro.
        if (aux_cnt >= (maxEpocas*10)/100)
            break;
        endif
    else 
        erro_anterior = erro;
        aux_cnt = 0;
    endif;
          
  endfor;

endfunction