-module(geometry).
-export([test/0, area/1]).

test() ->
    12 = area({rectangle, 3, 4}),
    144 = area({square, 12}),
    tests_worked.

area({rectangle, Width, Height}) -> Width * Height;
area({square, Side}) -> Side * Side;
area({circle, Radius}) -> 3.14159 * Radius * Radius;
area({triangle, Height, Base}) -> 0.5 * Height * Base;
area({triangle, A, B, C}) ->
    S = (A + B + C)/2,
    math:sqrt(S * (S - A) * (S - B) * (S - C)).
