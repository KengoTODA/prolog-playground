replace('G', 'C').
replace('C', 'G').
replace('T', 'A').
replace('A', 'U').

rna_transcription(Rna, Dna) :-
    string_chars(Rna, RnaChars),
    maplist(replace, RnaChars, DnaChars),
    string_chars(Dna, DnaChars).
