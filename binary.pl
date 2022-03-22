% working_directory(CWD,'/Users/kengo/GitHub/prolog-playground').


binary(Str, Dec) :-
    string_chars(Str, Chars),
    binary_(Chars, Dec).

binary_([], Dec) :-
    Dec is 0.

binary_(['0' | Rest], Dec) :-
    binary_(Rest, Dec).

binary_(['1' | Rest], Dec) :-
    binary_(Rest, Temp),
    length(Rest, Length),
    Dec is Temp + 2 ^ Length.
