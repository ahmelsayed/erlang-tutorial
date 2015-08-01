-module(math_functions).
-export([odd/1, even/1, filter/2, split/1, split1/1]).
-import(lists, [reverse/1]).

odd(X) ->
    case (X rem 2) of
        0 -> false;
        1 -> true
    end.

even(X) -> not odd(X).

filter(F, L) ->
    [X || X <- L, F(X)].

split(L) ->
    Odds = filter(fun(X) -> odd(X) end, L),
    Evens = filter(fun(X) -> even(X) end, L),
    {Evens, Odds}.

split1(L) ->
    split1_acc(L, [], []).

split1_acc([H|T], Evens, Odds) ->
    case even(H) of
        true -> split1_acc(T, [H|Evens], Odds);
        false -> split1_acc(T, Evens, [H|Odds])
    end;
split1_acc([], Evens, Odds) ->
    {reverse(Evens), reverse(Odds)}.
