-module(math_functions).
-export([odd/1, even/1]).

odd(X) ->
    case (X rem 2) of
        0 -> false;
        1 -> true
    end.

even(X) -> not odd(X).
