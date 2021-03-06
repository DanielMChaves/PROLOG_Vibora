:- module(_,_).

% Modos de Uso
% vibora(IN,IN,IN,OUT)

% Pseudocodigo
%
% datos[a,b,c,d]
% matrix[M][N]
%
% for(i=0,i<M,i++)
%   for(j=0,j<M,j++)
%     matriz[i][j]=datos[posicion_que_toque]

% vibora/4(colores,lista_m,lista_n,resultado)
vibora([],_,_,[]).
vibora(C,TM,TN,RF):-
  C \= [],
  bucle_i(C,C,TN,TM,R),
  comprobar(a,R,RF).

% bucle_i/5(colores,copia_colores,lista_m,lista_n,resultado)
bucle_i(_,_,[],_,[]).
bucle_i(O,C,[_|TMs],TN,[R|Rs]):-
  bucle_j(O,C,TN,R,Resto),
  bucle_i(O,Resto,TMs,TN,Rs).

% bucle_j/4(colores,copia_colores,lista_n,resultado,resto_copia)
bucle_j(O,[],T,R,Resto):-
  T \= [],
  bucle_j(O,O,T,R,Resto).
bucle_j(_,C,[],[],C):-
  C \= [].
bucle_j(_,[],[],[],[]).
bucle_j(O,[C|Cs],[_|Ts],[C|Rs],Resto):-
  bucle_j(O,Cs,Ts,Rs,Resto).

% comprobar/3(flag,lista_original,resultado)
comprobar(_,[],[]).
comprobar(a,[L|Ls],[L|Rs]) :-
  comprobar(b,Ls,Rs).
comprobar(b,[L|Ls],[R|Rs]) :-
  reversible(L,R),
  comprobar(a,Ls,Rs).

% Metodos Auxiliares
concatenar([],Cs,Cs).
concatenar([A|As],Bs,[A|Cs]):-
  concatenar(As,Bs,Cs).

reversible([],[]).
reversible([H|T],R) :-
  reversible(T,RevT),
  concatenar(RevT,[H],R).

% Ejemplo modo vibora(IN,IN,IN,OUT)
% ?- vibora([a,b,c,d],[_,_,_,_,_],[_,_,_],R).
% R = [[a,b,c,d,a],[b,a,d,c,b],[c,d,a,b,c]]? 
