male(grandfather).
male(taher).
male(bahar).
male(father).
male(mohsin).
female(child1_taher).
female(child2_taher).
female(child3_taher).
female(child1_bahar).
female(child2_bahar).
male(me).
male(sibling1).
male(sibling2).
female(child1_mohsin).
female(child2_mohsin).
female(child3_mohsin).
female(child4_mohsin).

parent(grandfather,taher).
parent(grandfather,bahar).
parent(grandfather,father).
parent(grandfather,mohsin).
parent(taher,child1_taher).
parent(taher,child2_taher).
parent(taher,child3_taher).
parent(bahar,child1_bahar).
parent(bahar,child2_bahar).
parent(father,me).
parent(father,sibling1).
parent(father,sibling2).
parent(mohin,child1_mohin).
parent(mohin,child2_mohin).
parent(mohin,child3_mohin).
parent(mohin,child4_mohin).

cousin(X,Y) :-
  parent(F1,X),
  parent(F1,Z),
  parent(F2,Y),
  parent(F2,W),
  X \= Y,
  Z \= W,
  F1 \= F2,
  grandfather == F1.

degree_of_cousin(X,Y,N) :-
  cousin(X,Y),
  N is 1.
degree_of_cousin(X,Y,N) :-
  cousin(X,Y),
  parent(Z,X),
  parent(Z,W),
  not(X = W),
  degree_of_cousin(Z,W,N1),
  N is N1 + 1.

removal_of_cousin(X,Y,N) :-
  cousin(X,Y),
  N is 0.
removal_of_cousin(X,Y,N) :-
  cousin(X,Y),
  parent(Z,X),
  parent(Z,W),
  not(X = W),
  removal_of_cousin(Z,W,N1),
  N is N1 + 1.