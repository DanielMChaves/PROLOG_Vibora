:- module(_,_).

% Pseudocodigo
% datos[a,b,c,d]
% matrix[M][N]
%
% for(i = 0, i < M, i++)
%   for(j = 0, j < M, j++)
%     matriz[i][j] = datos[posicion_que_toque]

% vibora/4

% bucle_i/5(lista_orignal, copia, lista_m, lista_n, resultado)
% bucle_i([a,b,c,d],[a,b,c,d],[_,_],[_,_], R) :-

bucle_j(_,_,[],_,[]).
bucle_i(O, [C|Cs], [TM|TMs], [TN|TNs], [R|Rs]) :-
  bucle_j(O, [C|Cs], [TN|TNs], R),
  bucle_i(O, Cs, TMs, TNs, Rs).

% bucle_j/4(lista_orignal, copia, lista_n, resultado)
% bucle_j([a,b,c,d],[a,b,c,d],[_,_,_,_,_,_], R) :-

bucle_j(O,[],T,R) :-
  bucle_j(O,O,T,R).
bucle_j(_,_,[],[]).
bucle_j(O, [C|Cs], [T|Ts], [C|Rs]) :-
  bucle_j(O, Cs, Ts, Rs).

% ?- vibora([a,b,c,d],[_,_,_,_,_],[_,_,_],R).
% R = [[a,b,c,d,a],[b,a,d,c,b],[c,d,a,b,c]] ? 
