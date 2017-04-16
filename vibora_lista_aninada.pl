:- module(_,_).

% Modos de Uso
% vibora(IN,IN,IN,OUT)

% Metodología
%
% 1) Creamos una lista del tamaño (M*N)
% 2) Rellenamos la lista con la secuencia
% 3) Separamos la lista en sublistas

%vibora/4(colores,lista_m,lista_n,resultado)
vibora(C,TM,TN,R):-
  crearLista(TN,TM,R1),
  rellenar(C,C,R1,R2),
  separar(TM,TN,R2,R).

%crearLista/3(lista_m,lista_n,resultado)
crearLista([],_,[]).
crearLista([_|TMs],TN,R):-
  crearListaAux(TN,R1),
  crearLista(TMs,TN,R2),
  concatenar(R1,R2,R).

crearListaAux([],[]).
crearListaAux([_|TNs],[x|Rs]):-
  crearListaAux(TNs,Rs).

concatenar([],Cs,Cs).
concatenar([A|As],Bs,[A|Cs]):-
  concatenar(As,Bs,Cs).

%rellenar/4(colores,copia_colores,lista,resultado)
rellenar(_,_,[],[]).
rellenar(C,[],L,R):-
  rellenar(C,C,L,R).
  rellenar(C,[CC|CCs],[_|Ls],[CC|Rs]):-
  rellenar(C,CCs,Ls,Rs).

%separar/4(lista_m,lista_n,lista_rellena,resultado)
separar(_,[],_,[]).
separar(TM,[_|TNs],LR,[R|Rs]):-
  separarAux(TM,LR,LRs,R),
  separar(TM,TNs,LRs,Rs).

separarAux([],L,L,[]).
separarAux([_|TMs],[E|Es],L,[E|Rs]):-
  separarAux(TMs,Es,L,Rs).

% Ejemplo modo vibora(IN,IN,IN,OUT)
% ?- vibora([a,b,c,d],[_,_,_,_,_],[_,_,_],R).
% R = [[a,b,c,d,a],[b,a,d,c,b],[c,d,a,b,c]]? 
