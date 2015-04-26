function result = side(B, A, C)  
  result = sign((B(1,1) - A(1,1))  * (C(1,2) - A(1,2)) - (B(1,2) - A(1,2)) * (C(1,1) - A(1,1)));
end