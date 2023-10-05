domains
    s=string.
    i = real.
    il= real*.
    sl = string*.

predicates
    nondeterm min_price(il,i)
    nondeterm max_price(il,i)
    nondeterm min(i,i,i)
    nondeterm max(i,i,i)
    nondeterm list_same_sub(sl)
    nondeterm list_same_pub(sl)
    nondeterm book(s,s,s,s,i)
    nondeterm print_books_pub(s).
    nondeterm print_books_sub(s).
    nondeterm list_books(s,s,s,s,i).
    nondeterm list_prices(s,i).
    nondeterm books_with_min_price(s)
    nondeterm books_with_max_price(s)
clauses

    book("Book1","math", "Author 1", "Publisher A", 10.15).
    book("Book2","math", "Author 2", "Publisher B", 20.52).
    book("Book3","language", "Author 3", "Publisher A", 15.54).
    book("Book4","science", "Author 4", "Publisher C", 25.65).
    book("Book5","science", "Author 5", "Publisher B", 45.64).
    book("Book6","computer", "Author 6", "Publisher D", 15.54).
    book("Book7","science", "Author 7", "Publisher A", 10.15).
    book("Book8","computer", "Author 8", "Publisher B", 30.72).
    book("Book9","language", "Author 9", "Publisher D", 45.64).
    book("Book10","computer", "Author 10", "Publisher C", 25.85).
    book("Book11","science", "Author 11", "Publisher B", 10.15).
    book("Book12","math", "Author 12", "Publisher D", 11.14).
    
% Minimum book Price.

min_price([], 100000).
min_price([H | T], MinPrice) :-min_price(T, RestMin),min(H, RestMin, MinPrice). 
min(X, Y, X) :- X <= Y.
min(X, Y, Y) :- X > Y.

% books with minimum price

books_with_min_price(Name):- min_price([11.14,14.54,25.85,45.64,30.72,10.15,15.54, 30.34, 25.65, 15.54, 20.52, 10.15], MinPrice),
write("Minimum Price is "),write(MinPrice),nl,nl,book(Name,_,_,_,MinPrice).
    
% Maximum book Price.

max_price([], -1).
max_price([H | T], MaxPrice) :- max_price(T, RestMax),max(H, RestMax, MaxPrice).
max(X, Y, X) :- X >= Y.
max(X, Y, Y) :- X < Y.  

% books with maximum price

books_with_max_price(Name):- max_price([11.14,14.54,25.85,45.64,30.72,10.15,15.54, 30.34, 25.65, 15.54, 20.52, 10.15], MaxPrice),
write("Maximum Price is "),write(MaxPrice),nl,nl,book(Name,_,_,_,MaxPrice).

% List of books about the same subject.

list_same_sub([H | T]) :-nl,nl, write(H), nl,print_books_sub(H),list_same_sub(T).
list_same_sub([]).
print_books_sub(Subject) :-book(Name, Subject, _, _, _),write(Name), write("  "),fail.
print_books_sub(_).

% List of books by the same publisher.

list_same_pub([H | T]) :-nl,nl, write(H), nl,print_books_pub(H),list_same_pub(T).
list_same_pub([]).
print_books_pub(Publisher):- book(Name, _, _, Publisher, _),write(Name), write("  "),fail.
print_books_pub(_).

% List All books data

list_books(N,S,A,Pub,P):-book(N,S,A,Pub,P),nl,nl.

% List All books Prices

list_prices(Name,Price):-book(Name,_,_,_,Price),nl,nl.
    
    
goal
    % min_price([11.14,14.54,25.85,45.64,30.72,10.15,15.54, 30.34, 25.65, 15.54, 20.52, 10.15], MinPrice).
    % max_price([11.14,14.54,25.85,45.64,30.72,10.15,15.54, 30.34, 25.65, 15.54, 20.52, 10.15], MaxPrice).
    % books_with_min_price(Name).
    % books_with_max_price(Name).
    % list_same_sub(["science","math","language","computer"]).
    % list_same_pub(["Publisher A","Publisher B","Publisher C","Publisher D"]).
    % list_books(N,S,A,Pub,P).
    % list_prices(Name,Price).
    