-module(lib_misc).
-export([for/3, sum/1, map/2, qsort/1, pathag/1, perms/1, max/2, filter/2, odds_and_evens1/1, odds_and_evens2/1, my_tuple_to_list/1]).

for(Max, Max, F) -> [F(Max)];
for(I, Max, F) -> [F(I)|for(I+1,Max,F)].


sum([H|T]) -> H + sum(T);
sum([]) -> 0.

% map(F, [H|T]) -> [F(H)|map(F, T)];
% map(_, []) -> [].
map(F, L) -> [F(X) || X <- L].

qsort([Pivot|T]) ->
    qsort([X || X <- T, X < Pivot])
    ++ [Pivot] ++
    qsort([X || X <- T, X > Pivot]);
qsort([]) -> [].

pathag(N) ->
    [ {A,B,C} ||
        A <- lists:seq(1,N),
        B <- lists:seq(1,N),
        C <- lists:seq(1,N),
        A+B+C =< N,
        A*A + B*B =:= C*C
    ].

perms([]) -> [[]];
perms(L) -> [[H|T] || H <- L, T <- perms(L--[H])].

max(X, Y) when X > Y -> X;
max(_, Y) -> Y.

filter(P, [H|T]) ->
    case (P(H)) of
        true -> [H | filter(P, T)];
        false -> filter(P, T)
    end;
filter(_, []) -> [].

odds_and_evens1(L) ->
    Odds = [X || X <- L, (X rem 2) =:= 1],
    Evens = [X || X <- L, (X rem 2) =:= 0],
    {Odds, Evens}.

odds_and_evens2(L) ->
    odds_and_evens_acc(L, [], []).

odds_and_evens_acc([H|T], Odds, Evens) ->
    case (H rem 2) of
        1 -> odds_and_evens_acc(T, [H|Odds], Evens);
        0 -> odds_and_evens_acc(T, Odds, [H|Evens])
    end;
odds_and_evens_acc([], Odds, Evens) ->
    {lists:reverse(Odds), lists:reverse(Evens)}.

my_tuple_to_list(T) -> lists:reverse(my_tuple_to_list(T, [])).
my_tuple_to_list({}, L) -> L;
my_tuple_to_list(T, L) ->
    my_tuple_to_list(erlang:delete_element(1, T), [element(1, T)|L]).
