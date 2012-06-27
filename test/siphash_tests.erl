-module(siphash_tests).
-include_lib("eunit/include/eunit.hrl").

check_vector({Key, Data, Expected}) ->
    Found = siphash:hash24(Key, Data),
    ?assert(Found =:= Expected).

check_vectors_test_() ->
    fun () -> 
	    Vectors =
		[{<<"aON1dHrq90SbG8Hx">>,
		 <<"v7LyiwuCrB7EgAibPve6Yg2gLmggxE6j7ocR37EudrH_P9XX2rQK">>,
		 <<147,73,50,63,71,98,203,42>>}],
	    lists:foreach(fun check_vector/1, Vectors)
    end.
